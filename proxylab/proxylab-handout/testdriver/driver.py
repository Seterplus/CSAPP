#!/usr//bin/python
#
# driver.py
#

import subprocess
import re
import optparse
import random
import string

def main():

    # max scores
    max_score = {'proxy': 90, 'basic': 30, 'concr': 30, 'cache': 30}

    # Parse the command line arguments
    p = optparse.OptionParser()
    p.add_option('-A', action='store_true', dest='autograde',
                 help='emit autoresult string for Autolab')
    opts, args = p.parse_args()
    autograde = opts.autograde

    port = random.randint(3000, 15213)

    # Check the correctness of the proxy
    print 'Part I: Testing proxy with single client...'
    print '../proxy', port
    p = subprocess.Popen('./test-proxy.pl -t 1 -p '+'%i'%port,
                         shell=True, stdout=subprocess.PIPE)
    stdout_data = p.communicate()[0]

    # Emit the result of Part I
    stdout_data = re.split('\n', stdout_data)
    for line in stdout_data:
        if re.match('BASIC_RESULTS', line):
            result_basic = re.findall(r'(\d+)', line)
        else:
            print '%s' % line
    result_basic = int(result_basic[0])
    print '\t basic proxy score =', result_basic

    # Check if concurrency is OK
    print 'Part II: Testing proxy with multiple clients...'
    print '../proxy', port
    p = subprocess.Popen('./test-proxy.pl -t 2 -p '+'%i'%port,
                         shell=True, stdout=subprocess.PIPE)
    stdout_data = p.communicate()[0]

    # Emit the result of Part II
    stdout_data = re.split('\n', stdout_data)
    for line in stdout_data:
        if re.match('CONCURRENCY_RESULTS', line):
            result_concr = re.findall(r'(\d+)', line)
        else:
            print '%s' % line
    result_concr = int(result_concr[0])
    print '\t concurrency score =', result_concr

    # Check if caching works well
    print 'Part III: Testing proxy\' caching functionality...'
    print '../proxy', port
    p = subprocess.Popen('./test-proxy.pl -t 3 -p '+'%i'%port,
                         shell=True, stdout=subprocess.PIPE)
    stdout_data = p.communicate()[0]

    # Emit the result of Part II
    stdout_data = re.split('\n', stdout_data)
    for line in stdout_data:
        if re.match('CACHING_RESULTS', line):
            result_cache = re.findall(r'(\d+)', line)
        else:
            print '%s' % line
    result_cache = int(result_cache[0])
    print '\t cache score =', result_cache

    total_score = result_basic+result_concr+result_cache

    print '\nTotal score: %d out of %d' % \
          (total_score, max_score['proxy'])

    # Emit autoresult string for Autolab if called with -A option
    if autograde:
        autoresult="%d:%d:%d:%d" % (total_score, result_basic, result_concr, result_cache)
        print '\nAUTORESULT_STRING=%s' % autoresult


if __name__ == '__main__':
    main()
