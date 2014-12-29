#!/usr/bin/perl
use Getopt::Std;

##############################################################
## driver.pl - CS:APP Proxy Lab driver v1.1                 ##
##                                                          ##
## Driver for PKU, ICS proxy lab, Fall 2014.                ##
## Functionality: single client, multiple clients, caching. ##
##                                                          ##
## Derived from Fall 2003 driver, modified as needed        ##
##                                                          ##
## originally by Stavros Harizopoulos, stavros@cs.cmu.edu   ##
##                                                          ##
## modifed by Tianyuan Jiang, jtyuan@pku.edu.cn             ##
##############################################################

use strict;
use Driver;
use File::Copy;
use FileHandle;
use Socket;
use POSIX qw(ctime);
use POSIX qw(mktime);
use POSIX qw(strftime);
use POSIX qw(ceil);
use POSIX ":sys_wait_h";
use POSIX ":signal_h";

###
# Print usage information
#
sub usage {
    printf STDERR "$_[0]\n";
    printf STDERR "Usage: $0 [-h] [-u userid] [-p port_number] [-t lab_part]\n";
    printf STDERR "Options:\n";
    printf STDERR "  -h              Print this message.\n";
    printf STDERR "  -u userid       Notify autolab server as userid.\n";
    printf STDERR "  -p port_number  Specify a random number like 3333 or 5000 here.\n";
    printf STDERR "                  The default value (5555) will fail if other students\n";
    printf STDERR "                  use the driver on the same machine at the same time.\n";
    printf STDERR "  -t lab_part     Type 1,2, or 3 here to test a specific part (one client,\n";
    printf STDERR "                  many clients, caching) or don't set it for all tests.\n";
    die "\n";
}

###
# Declarations and Initialization
#
my $userid;
my $version;
my $result;
my $PORT_PROXY = 5555;
my $PORT_TINY = 5655;
my $PART1 = 0;
my $PART2 = 0;
my $PART3 = 0;
my $MAX_SCORE = 90;
my $single_score = 0;
my $multiple_score = 0;
my $cache_score = 0;
my $PID_PROXY;
my $PID_TINY;

my $PROXY_FORWARD = "proxy.forward";
my ($i, @ctests);
my %options = ('debug' => 1);

###
# Objects
#
#my $UA = new LWP::UserAgent;
#my $LE = HTML::LinkExtor->new();
#$UA->agent("Mozilla/8.0");
#$UA->timeout(60);

###
# Reads an entire file.
#
sub read_file {
    my $file = shift;
    my $contents;
    open MYFILE, "< $file" or return undef;
    binmode MYFILE;
    $contents = "";
    while (<MYFILE>) {
	$contents .= $_;
    }
    close MYFILE;
    return $contents;
}

###
# Forks a child to run the tiny web server
#
sub run_tiny {
    my $x;
    my $pid = fork;
    return -1 if(!defined $pid);

    if (!$pid) {
        print "../tiny/tiny $PORT_TINY\n";
        exec ("../tiny/tiny $PORT_TINY");
        exit 10;
    } else {
        # Wait a little while and make sure it didn't crash up front
        sleep 3;
        $x = waitpid(-1, &WNOHANG);
        if ($x == $pid) {
            print "Oops, tiny crashed! exit this test...\n";
            return -1;
        }
    }
    return $pid;
}

###
# Forks a child to run the proxy
#
sub run_proxy {
    my $x;

    # Run the proxy
    my $pid = fork;
    return -1 if(!defined $pid);
    if (!$pid) {
	print "../proxy $PORT_PROXY\n";
	exec ("../proxy $PORT_PROXY");
	exit 10;
    } else {
	# Wait a little while and make sure it didn't crash up front
	sleep 3;
	$x = waitpid(-1, &WNOHANG);
	if ($x == $pid) {
	    print_exit_status($?);
            print "\t \t Exiting this test... \n";
	    return -1;
	}
    }
    return $pid;
}

sub print_exit_status {
  my $status = shift;
  print "\t \t Oops, proxy crashed! ";

  if (WIFEXITED($status)) {
    my $exit_status = WEXITSTATUS($status);
    print "Proxy exited with status: $exit_status\n";
  }
  elsif (WIFSIGNALED($status)) {
    my $signal = WTERMSIG($status);
    print "Proxy terminated by signal: $signal\n";
    if ($signal == SIGSEGV) {
      print "\t \t Segmentation Fault\n";
    }
  }
  else {
    print "Proxy exit code = $status\n";
  }
}

###
# Send a request through the proxy
#
sub do_request {
    my $url = shift;
    my @response = [];
    my $replyglom = "";
    my $str = "";
    
    socket SOCK2, AF_INET, SOCK_STREAM, getprotobyname('tcp');
    my $addr = sockaddr_in($PORT_PROXY, inet_aton("127.0.0.1"));
    connect SOCK2, $addr;
    SOCK2->autoflush();
    print SOCK2 "GET $url HTTP/1.0\r\n\r\n";

    #get reply first throw away header
    while($str ne "\r\n" && !eof(SOCK2)){
	$str = <SOCK2>;
    }

    #now get the rest of the reply
    if( !eof(SOCK2) ){
	binmode SOCK2;
	@response = <SOCK2>;
    }
    close SOCK2;
    
    $replyglom = join "", @response;
    
    return $replyglom;
}

###
# Read url from file, check replies from files
#
sub test_forwarding {
    my $needed = shift;
    my ($passed, $tried);


    open FORWARD_FILE, $PROXY_FORWARD;
    while (<FORWARD_FILE>) {
	chomp;
	my $filename = $_;

	print "\t Request $filename ...\n";
	my $reply = do_request("http://localhost:$PORT_TINY/$filename");
	my $expected = read_file $filename;
	if ($reply ne $expected) {
	    print "\t \t did not pass\n";
	}
	else {
	    $passed++;
	    print "\t \t passed\n";
	}
	$tried++;
	last if ($tried == $needed);
    }
    close FORWARD_FILE;
    return $passed;
}


############################################################
##
## PART I: test single client
##
##    Grading criteria for correctness (total 30)
##       24  handle various requests 
##       6   SIGPIPE handling
##
############################################################

sub test_single {
    
    print "\nPART I: Testing single client...\n" if($options{'debug'});
    $PID_PROXY = run_proxy();
    return -1 if($PID_PROXY == -1);
    
    $PID_TINY = run_tiny();
    return -1 if($PID_TINY == -1);
    print "\nStarted tiny web server\n" if($options{'debug'});

    # fork a child to send 4 requests
    my $tried = 4;

    my $pid = fork;
    return -1 if(!defined $pid);

    if (!$pid) {
        my $passed += test_forwarding($tried);
        exit $passed;
    }

    # give child 3 secs to finish, then check if it exited

    sleep(3);

    # Test crash?
    my $temp = waitpid($PID_PROXY, &WNOHANG);
    if ($temp == $PID_PROXY) {
      print_exit_status($?);
      kill 9, $PID_TINY;
      kill 9, $pid;
      $PORT_PROXY++;
        return -1;
    }

    $temp = waitpid($pid, &WNOHANG);
    if ($temp != $pid) {
        print "\t \t Timeout! Single client test failed..\n";
        kill 9, $PID_TINY;
        kill 9, $PID_PROXY;
        kill 9, $pid;
        $PORT_PROXY++;
        return -1;
    }
    else {
        my $exit_value = $? >> 8;
        if ($exit_value > 0 && $exit_value < $tried + 1) {
            $single_score += 6 * $exit_value;
	    print "\t \t $exit_value out of $tried tests passed\n" if($options{'debug'});
        }
        else {
            print "\t \t Single client test failed..\n";
            kill 9, $PID_TINY;
            kill 9, $PID_PROXY;
            kill 9, $pid;
            $PORT_PROXY++;
            return -1;

        }
    }

    print "\nTesting SIGPIPE signal handling ...\n";

    socket SOCK, AF_INET, SOCK_STREAM, getprotobyname('tcp');
    my $addr = sockaddr_in($PORT_PROXY, inet_aton("127.0.0.1"));
    connect SOCK, $addr;
    SOCK->autoflush();
    print SOCK "GET http://www.ietf.org/rfc/rfc2068.txt HTTP/1.0\r\n\r\n";
    close SOCK;

    sleep(3);

    # Test crash?
    $temp = waitpid(-1, &WNOHANG);
    if ($temp == $PID_PROXY) {
	$PORT_PROXY ++;
	print_exit_status($?);
	print "\t \t Did not pass\n";
    } else {
	$single_score += 6;
	kill 9, $PID_PROXY;
	print "\t \t passed\n";
    }
    $PORT_PROXY++;
    kill 9, $PID_TINY;
    return $single_score;
}

############################################################
##
## PART II: test multiple clients
##
##   Grading criteria:
##      30 points 
##
############################################################
sub test_multiple {
    print "\nPART II: Testing multiple clients...\n" if($options{'debug'});
    $PID_PROXY = run_proxy();
    return -1 if($PID_PROXY == -1);

    $PID_TINY = run_tiny();
    return -1 if($PID_TINY == -1);
    print "\nStarted tiny web server\n" if($options{'debug'});

    # Start a child to send a slow request
    my $pid = fork;
    return -1 if(!defined $pid);

    if (!$pid) {

        my $filename = "96k1.txt";
        print "Slow connection to proxy requesting file $filename\n" if($options{'debug'});

        socket SOCK, AF_INET, SOCK_STREAM, getprotobyname('tcp');
        my $addr = sockaddr_in($PORT_PROXY, inet_aton("127.0.0.1"));
        connect SOCK, $addr;
        SOCK->autoflush();

        # connected. now wait for 3 secs
        # (meanwhile we'll send other concurrent requests to the proxy)

        sleep(3);

        # we should still be connected. Send request, check reply

        print SOCK "GET http://localhost:$PORT_TINY/$filename HTTP/1.0\r\n\r\n";

        my @response = [];
        my $replyglom = "";
        my $str = "";
        #get reply first throw away header
        while($str ne "\r\n" && !eof(SOCK)){
            $str = <SOCK>;
        }
        #now get the rest of the reply
        if( !eof(SOCK) ){
            binmode SOCK;
            @response = <SOCK>;
        }
        close SOCK;
        $replyglom = join "", @response;

        my $expected = read_file $filename;

        if ($replyglom ne $expected) {
            print "\t reply for $filename didn't match..\n\n";
            exit 0;
        }
        else {
            print "\t reply for $filename matches..\n\n";
            exit 1;
        }
    }

    # continue with 2 fast requests to check concurrency.
    
    my $pid2 = fork;
    return -1 if(!defined $pid2);

    if (!$pid2) {
        my $passed += test_forwarding(2);
        exit $passed;
    }

    # Test crash?
    my $temp = waitpid($PID_PROXY, &WNOHANG);
    if ($temp == $PID_PROXY) {
        print_exit_status($?);
        kill 9, $PID_TINY;
        kill 9, $pid;
        kill 9, $pid2;
        $PORT_PROXY++;
        return -1;
    } 

    # give 2nd child 3 secs to finish, then check if it exited

    sleep(3);
    my $success1;
    my $success2;

    $temp = waitpid($pid2, &WNOHANG);
    if ($temp != $pid2) {
        print "\t \t Timeout! Concurrency test failed..\n";
        kill 9, $PID_TINY;
        kill 9, $PID_PROXY;
        kill 9, $pid;
        kill 9, $pid2;
        $PORT_PROXY++;
        return -1;
    }
    else {
        my $exit_value = $? >> 8;
        if ($exit_value == 2) {
            $success2 = 1;
        }
        else { 
            $success2 = 0;
        }
    }

    # 2nd child is done, let's wait until the 1st child is done

    sleep(3);
    $temp = waitpid($pid, &WNOHANG);
    if ($temp != $pid) {
        print "\t \t Timeout! Concurrency test failed..\n";
        kill 9, $PID_TINY;
        kill 9, $PID_PROXY;
        kill 9, $pid;
        kill 9, $pid2;
        $PORT_PROXY++;
        return -1;
    }
    else {
        my $exit_value = $? >> 8;
        if ($exit_value == 1) {
            $success1 = 1;
        }
        else {
            $success1 = 0;
        }
    }

    # compute score

    if ($success1 * $success2 == 1) {
        print "\t \t Concurrency test passed!\n";
        $multiple_score = 30;
    }

    kill 9, $PID_PROXY;
    kill 9, $PID_TINY;
    $PORT_PROXY++;
    return $multiple_score;
}

############################################################
##
##  PART III: test cache
##  
##     Grading criteria 
##       10 cache one object 
##       10 cache multiple objects
##       10 evict object when cache is full (1MB cache)
##
############################################################
sub test_cache {
    my $exit_value = 0;
    # Single object test

    print "\nPART III(a) : Testing Cache (single object)...\n" if($options{'debug'});
    $PID_PROXY = run_proxy();
    return -1 if($PID_PROXY == -1);

    $PID_TINY = run_tiny();
    return -1 if($PID_TINY == -1);
    print "\nStarted tiny web server" if($options{'debug'});

    # Connect to the proxy. Have a child do this
    # (since the proxy may get stuck).

    print "\nConnecting to proxy.." if($options{'debug'});
    my $pid = fork;
    return -1 if(!defined $pid);

    if (!$pid) {
        my $reply = do_request("http://localhost:$PORT_TINY/50k.txt");
        print "\tGot reply" if($options{'debug'});

        # kill tiny, then ask again the proxy
        kill 9, $PID_TINY;   
        print "\nKilled tiny" if($options{'debug'});
        print "\nRequesting same url again..  " if($options{'debug'});       

        my $reply2 = do_request("http://localhost:$PORT_TINY/50k.txt");
        my $expected = read_file "50k.txt";
        if ($reply ne $reply2 || $reply2 ne $expected) {
            print "\t reply didn't match..\n";
            exit 0;
        }
        else {
            print "\t object found in cache! \t --- 10 points\n"; 
            exit 10;
        }
    } 
   
    # Wait for a bit, then check if child terminated
    sleep(4);

    # Test proxy crash
    my $temp;
    while (($temp = waitpid(-1, &WNOHANG)) > 0) {
        if ($temp == $PID_PROXY) {
	    print_exit_status($?);
            kill 9, $PID_TINY;
            kill 9, $pid;
            return -1;
        } 
        # if child terminated, its exit status has the score
        if ($temp == $pid) {
            $exit_value = $? >> 8;  
            kill 9, $PID_PROXY;
            if ($exit_value == 10) {
                $cache_score += $exit_value;
            }
            last;
        }
    }
    if ($temp != $pid || $exit_value != 10) {
        print "Caching one object did not work\n";
        kill 9, $PID_PROXY;
        kill 9, $PID_TINY;
        kill 9, $pid;
    }

    # Multiple objects + eviction test

    sleep 1;

    print "\nPart III(b): Testing Cache (multiple objects + eviction)...\n" if($options{'debug'});
    $PID_PROXY = run_proxy();
    return -1 if($PID_PROXY == -1);
    $PID_TINY = run_tiny();
    return -1 if($PID_TINY == -1);
    print "\nStarted tiny web server" if($options{'debug'});

    # Connect to the proxy
    print "\nConnecting to proxy.." if($options{'debug'});
    $pid = fork;
    return -1 if(!defined $pid);

    if (!$pid) {
     
        # make a bunch of requests to fill up the 1MB cache  
        my $reply1 = do_request("http://localhost:$PORT_TINY/50k.txt");
        print "\tGot replies: 1 " if($options{'debug'});
        my $reply2 = do_request("http://localhost:$PORT_TINY/96k1.txt");
        print " 2 " if($options{'debug'});
        my $reply3;
        my $i;
        for ($i = 3; $i <= 10; $i++) {
            system("cp 96k2.txt 96k$i.txt") == 0
                or die "$0: Could not copy sample files\n";
            $reply3 = do_request("http://localhost:$PORT_TINY/96k$i.txt");
            print " $i " if($options{'debug'});
            system("rm -f 96k$i.txt") == 0
                or die "$0: Could not remove sample files\n";
        }
        sleep 1; 
        # kill tiny, then ask again the proxy
        kill 9, $PID_TINY;   
        print "\nKilled tiny" if($options{'debug'});
        print "\nRequesting a sample file again..  " if($options{'debug'});       

        my $reply4 = do_request("http://localhost:$PORT_TINY/96k1.txt");
        my $expected = read_file "96k1.txt";
        if ($reply2 ne $reply4 || $reply4 ne $expected) {
            print "\t reply didn't match..\n";
            print "\t waiting for next test (up to 10 secs)\n";
            exit 0;
        }
        else {
            print "\t object found in cache! \t --- 10 points\n"; 
            print "\t waiting for next test (up to 10 secs)\n";
            exit 10;
        }
    } 
   
    # Wait for a bit, then check if child terminated

    #################################################
    ##
    ## FOR SLOW CACHE IMPLEMENTATIONS WE MAY NEED
    ## TO INCREASE THIS VALUE
    ##
    #################################################

    sleep(10);

    # Test proxy crash
    while (($temp = waitpid(-1, &WNOHANG)) > 0) {
        if ($temp == $PID_PROXY) {
	    print_exit_status($?);
            kill 9, $PID_TINY;
            kill 9, $pid;
            return -1;
        } 
        # if child terminated, its exit status has the score
        if ($temp == $pid) {
            # don't kill proxy yet (we need it for testing eviction)
            kill 9, $PID_TINY;
            $exit_value = $? >> 8;
            if ($exit_value == 10) {
                $cache_score += $exit_value;
            }
            last;
        }
    }
    #child didn't terminate or there was a problem
    if ($temp != $pid || $exit_value != 10) {
        print "\nCaching multiple objects did not work\n";
        print "Check if your cache implementation is slow\n";
        kill 9, $PID_PROXY;
        kill 9, $PID_TINY;
        kill 9, $pid;
        return 0;
    } else {
        # testing eviction 
        $pid = fork;
        return -1 if(!defined $pid);
        if (!$pid) {
            $PID_TINY = run_tiny();
            exit -1 if($PID_TINY == -1);
            print "\nStarted tiny web server" if($options{'debug'});
            my $reply1 = do_request("http://localhost:$PORT_TINY/96k2.txt");
            
            sleep 1;
            # 50k.txt should have been evicted at this point

            kill 9, $PID_TINY;   
            print "\nKilled tiny" if($options{'debug'});
            print "\nRequesting a sample file again..  " if($options{'debug'});
            my $reply2 = do_request("http://localhost:$PORT_TINY/50k.txt");

            my $file50k = read_file "50k.txt";
            my $file96k2 = read_file "96k2.txt"; 
              
            if ($reply2 ne $file50k && $reply1 eq $file96k2) {
                print "\t object not found, LRU works! \t --- 10 points\n";
                exit 10;
            }
            else {
                if ($reply2 eq $file50k) {
                    print "\t LRU doesn't work -- file found in cache\n";
                } else {
                    print "\t --- connection problem\n"; 
                }
                exit 0;
            }
       }
   }
    # Wait for a bit, then check if child terminated
    sleep(7);
    while (($temp = waitpid(-1, &WNOHANG)) > 0) {
        if ($temp == $PID_PROXY) {
            print_exit_status($?);
            kill 9, $PID_TINY;
            kill 9, $pid;
            return -1;
        } 
        # if child terminated, its exit value has the score
        if ($temp == $pid) {
            my $exit_value = $? >> 8;
            kill 9, $PID_TINY;
            kill 9, $PID_PROXY;
            if ($exit_value == 10) {
                $cache_score += $exit_value;
            }
            last;
        }
    }
    if ($temp != $pid) {
        print "\t LRU eviction did not work\n";
        kill 9, $PID_PROXY;
        kill 9, $PID_TINY;
        kill 9, $pid;
    }
    return 0;
}   

###
# Main program
#

# parse comand line arguments
no strict;
getopts('hu:v:p:t:');

if ($opt_h) {
    usage();
}
$userid = "";
$version = 0;

if ($opt_u) {
    $userid = $opt_u;
}

if ($opt_v) {  # Hidden flag used by the autograder
    $version = $opt_v;
}

if ($opt_p) {
    $PORT_PROXY = $opt_p;
    $PORT_TINY = $PORT_PROXY + 100;
}

if ($opt_t) {
    if ($opt_t eq 1) {
        $PART1 = 1;
    }
    if ($opt_t eq 2) {
        $PART2 = 1;
    }
    if ($opt_t eq 3) {
        $PART3 = 1;
    }
} 
else {
    $PART1 = $PART2 = $PART3 = 1;
}

use strict 'vars';

###
# Call tests
#

autoflush STDOUT 1;

system("killall -q tiny"); 
system("killall -q proxy");

if ($PART1 == 1) {
    test_single(); 
    #print "$userid:\tsingle client score = $single_score\n";   
    print "BASIC_RESULTS = $single_score\n"
}

if ($PART2 == 1) {
    test_multiple();
    #print "$userid:\tmultiple clients score = $multiple_score\n";   
    print "CONCURRENCY_RESULTS = $multiple_score\n"
}

if ($PART3 == 1) {
    test_cache();
    #print "\n$userid:\tcache score = $cache_score\n";   
    print "CACHING_RESULTS = $cache_score\n"
}

system("killall -q tiny");
system("killall -q proxy");
#
# Send autoresult to server
#
my $total_score = $single_score + $multiple_score + $cache_score;
$result = "$version:$total_score:$single_score:$multiple_score:$cache_score";
if ($userid) {
    my $status =  submitr($Driver::SERVERHOST,
                      $Driver::SERVERPORT,
                      $Driver::COURSE,
                      $userid, "",
                      $Driver::LAB,
                      $result);
    if (!($status =~ /OK/)) {
        print "$status\n";
        print "Did not send autoresult string to the Autolab server.\n";
        exit(1);
    }
    print "Sent autoresult string to the Autolab server\n";
}

exit;

#
# submitr - Sends an autoresult string to the Autolab server
#
sub submitr {
    my $hostname = shift;
    my $port = shift;
    my $course = shift;
    my $userid = shift;
    my $pwd = shift;
    my $lab = shift;
    my $result = shift;

    my $internet_addr;
    my $enc_result;
    my $paddr;
    my $line;
    my $version;
    my $errcode;
    my $errmsg;

    # Establish the connection to the server
    socket(SERVER, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
    $internet_addr = inet_aton($hostname)
        or die "Cound not convert $hostname to an internet address: $!\n";
    $paddr = sockaddr_in($port, $internet_addr);
    connect(SERVER, $paddr)
        or die "Could not connect to $hostname:$port:$!\n";

    select((select(SERVER), $| = 1)[0]); # enable command buffering


    # Send HTTP request to server
    $enc_result = url_encode($result);
    print SERVER  "GET /$course/submitr.pl/?userid=$userid&pwd=$pwd&lab=$lab&result=$enc_result&submit=submit HTTP/1.0\r\n\r\n";

    # Get first HTTP response line
    $line = <SERVER>;
    chomp($line);
    ($version, $errcode, $errmsg) = split(/\s+/, $line);
    if ($errcode != 200) {
        return "Error: HTTP request failed with error $errcode: $errmsg";
    }

    # Read the remaining HTTP response header lines
    while ($line = <SERVER>) {
        if ($line =~ /^\r\n/) {
            last;
        }
    }

    # Read and return the response from the Autolab server
    $line = <SERVER>;
    chomp($line);

    close SERVER;
    return $line;
   
}
   
#
# url_encode - Encode text string so it can be included in URI of GET request
#
sub url_encode {
    my $value = shift;

    $value =~s/([^a-zA-Z0-9_\-.])/uc sprintf("%%%02x",ord($1))/eg;
    return $value;
}

