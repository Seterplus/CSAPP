
bufbomb:     file format elf32-i386


Disassembly of section .init:

0804875c <_init>:
 804875c:	55                   	push   %ebp
 804875d:	89 e5                	mov    %esp,%ebp
 804875f:	53                   	push   %ebx
 8048760:	83 ec 04             	sub    $0x4,%esp
 8048763:	e8 00 00 00 00       	call   8048768 <_init+0xc>
 8048768:	5b                   	pop    %ebx
 8048769:	81 c3 78 29 00 00    	add    $0x2978,%ebx
 804876f:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 8048775:	85 d2                	test   %edx,%edx
 8048777:	74 05                	je     804877e <_init+0x22>
 8048779:	e8 8e 00 00 00       	call   804880c <__gmon_start__@plt>
 804877e:	e8 dd 02 00 00       	call   8048a60 <frame_dummy>
 8048783:	e8 78 18 00 00       	call   804a000 <__do_global_ctors_aux>
 8048788:	58                   	pop    %eax
 8048789:	5b                   	pop    %ebx
 804878a:	c9                   	leave  
 804878b:	c3                   	ret    

Disassembly of section .plt:

0804878c <__errno_location@plt-0x10>:
 804878c:	ff 35 e4 b0 04 08    	pushl  0x804b0e4
 8048792:	ff 25 e8 b0 04 08    	jmp    *0x804b0e8
 8048798:	00 00                	add    %al,(%eax)
	...

0804879c <__errno_location@plt>:
 804879c:	ff 25 ec b0 04 08    	jmp    *0x804b0ec
 80487a2:	68 00 00 00 00       	push   $0x0
 80487a7:	e9 e0 ff ff ff       	jmp    804878c <_init+0x30>

080487ac <sprintf@plt>:
 80487ac:	ff 25 f0 b0 04 08    	jmp    *0x804b0f0
 80487b2:	68 08 00 00 00       	push   $0x8
 80487b7:	e9 d0 ff ff ff       	jmp    804878c <_init+0x30>

080487bc <srand@plt>:
 80487bc:	ff 25 f4 b0 04 08    	jmp    *0x804b0f4
 80487c2:	68 10 00 00 00       	push   $0x10
 80487c7:	e9 c0 ff ff ff       	jmp    804878c <_init+0x30>

080487cc <connect@plt>:
 80487cc:	ff 25 f8 b0 04 08    	jmp    *0x804b0f8
 80487d2:	68 18 00 00 00       	push   $0x18
 80487d7:	e9 b0 ff ff ff       	jmp    804878c <_init+0x30>

080487dc <mmap@plt>:
 80487dc:	ff 25 fc b0 04 08    	jmp    *0x804b0fc
 80487e2:	68 20 00 00 00       	push   $0x20
 80487e7:	e9 a0 ff ff ff       	jmp    804878c <_init+0x30>

080487ec <random@plt>:
 80487ec:	ff 25 00 b1 04 08    	jmp    *0x804b100
 80487f2:	68 28 00 00 00       	push   $0x28
 80487f7:	e9 90 ff ff ff       	jmp    804878c <_init+0x30>

080487fc <signal@plt>:
 80487fc:	ff 25 04 b1 04 08    	jmp    *0x804b104
 8048802:	68 30 00 00 00       	push   $0x30
 8048807:	e9 80 ff ff ff       	jmp    804878c <_init+0x30>

0804880c <__gmon_start__@plt>:
 804880c:	ff 25 08 b1 04 08    	jmp    *0x804b108
 8048812:	68 38 00 00 00       	push   $0x38
 8048817:	e9 70 ff ff ff       	jmp    804878c <_init+0x30>

0804881c <__isoc99_sscanf@plt>:
 804881c:	ff 25 0c b1 04 08    	jmp    *0x804b10c
 8048822:	68 40 00 00 00       	push   $0x40
 8048827:	e9 60 ff ff ff       	jmp    804878c <_init+0x30>

0804882c <calloc@plt>:
 804882c:	ff 25 10 b1 04 08    	jmp    *0x804b110
 8048832:	68 48 00 00 00       	push   $0x48
 8048837:	e9 50 ff ff ff       	jmp    804878c <_init+0x30>

0804883c <write@plt>:
 804883c:	ff 25 14 b1 04 08    	jmp    *0x804b114
 8048842:	68 50 00 00 00       	push   $0x50
 8048847:	e9 40 ff ff ff       	jmp    804878c <_init+0x30>

0804884c <memset@plt>:
 804884c:	ff 25 18 b1 04 08    	jmp    *0x804b118
 8048852:	68 58 00 00 00       	push   $0x58
 8048857:	e9 30 ff ff ff       	jmp    804878c <_init+0x30>

0804885c <__libc_start_main@plt>:
 804885c:	ff 25 1c b1 04 08    	jmp    *0x804b11c
 8048862:	68 60 00 00 00       	push   $0x60
 8048867:	e9 20 ff ff ff       	jmp    804878c <_init+0x30>

0804886c <_IO_getc@plt>:
 804886c:	ff 25 20 b1 04 08    	jmp    *0x804b120
 8048872:	68 68 00 00 00       	push   $0x68
 8048877:	e9 10 ff ff ff       	jmp    804878c <_init+0x30>

0804887c <read@plt>:
 804887c:	ff 25 24 b1 04 08    	jmp    *0x804b124
 8048882:	68 70 00 00 00       	push   $0x70
 8048887:	e9 00 ff ff ff       	jmp    804878c <_init+0x30>

0804888c <socket@plt>:
 804888c:	ff 25 28 b1 04 08    	jmp    *0x804b128
 8048892:	68 78 00 00 00       	push   $0x78
 8048897:	e9 f0 fe ff ff       	jmp    804878c <_init+0x30>

0804889c <bcopy@plt>:
 804889c:	ff 25 2c b1 04 08    	jmp    *0x804b12c
 80488a2:	68 80 00 00 00       	push   $0x80
 80488a7:	e9 e0 fe ff ff       	jmp    804878c <_init+0x30>

080488ac <getopt@plt>:
 80488ac:	ff 25 30 b1 04 08    	jmp    *0x804b130
 80488b2:	68 88 00 00 00       	push   $0x88
 80488b7:	e9 d0 fe ff ff       	jmp    804878c <_init+0x30>

080488bc <memcpy@plt>:
 80488bc:	ff 25 34 b1 04 08    	jmp    *0x804b134
 80488c2:	68 90 00 00 00       	push   $0x90
 80488c7:	e9 c0 fe ff ff       	jmp    804878c <_init+0x30>

080488cc <fopen@plt>:
 80488cc:	ff 25 38 b1 04 08    	jmp    *0x804b138
 80488d2:	68 98 00 00 00       	push   $0x98
 80488d7:	e9 b0 fe ff ff       	jmp    804878c <_init+0x30>

080488dc <alarm@plt>:
 80488dc:	ff 25 3c b1 04 08    	jmp    *0x804b13c
 80488e2:	68 a0 00 00 00       	push   $0xa0
 80488e7:	e9 a0 fe ff ff       	jmp    804878c <_init+0x30>

080488ec <strcpy@plt>:
 80488ec:	ff 25 40 b1 04 08    	jmp    *0x804b140
 80488f2:	68 a8 00 00 00       	push   $0xa8
 80488f7:	e9 90 fe ff ff       	jmp    804878c <_init+0x30>

080488fc <printf@plt>:
 80488fc:	ff 25 44 b1 04 08    	jmp    *0x804b144
 8048902:	68 b0 00 00 00       	push   $0xb0
 8048907:	e9 80 fe ff ff       	jmp    804878c <_init+0x30>

0804890c <strcasecmp@plt>:
 804890c:	ff 25 48 b1 04 08    	jmp    *0x804b148
 8048912:	68 b8 00 00 00       	push   $0xb8
 8048917:	e9 70 fe ff ff       	jmp    804878c <_init+0x30>

0804891c <srandom@plt>:
 804891c:	ff 25 4c b1 04 08    	jmp    *0x804b14c
 8048922:	68 c0 00 00 00       	push   $0xc0
 8048927:	e9 60 fe ff ff       	jmp    804878c <_init+0x30>

0804892c <close@plt>:
 804892c:	ff 25 50 b1 04 08    	jmp    *0x804b150
 8048932:	68 c8 00 00 00       	push   $0xc8
 8048937:	e9 50 fe ff ff       	jmp    804878c <_init+0x30>

0804893c <fwrite@plt>:
 804893c:	ff 25 54 b1 04 08    	jmp    *0x804b154
 8048942:	68 d0 00 00 00       	push   $0xd0
 8048947:	e9 40 fe ff ff       	jmp    804878c <_init+0x30>

0804894c <fprintf@plt>:
 804894c:	ff 25 58 b1 04 08    	jmp    *0x804b158
 8048952:	68 d8 00 00 00       	push   $0xd8
 8048957:	e9 30 fe ff ff       	jmp    804878c <_init+0x30>

0804895c <gethostname@plt>:
 804895c:	ff 25 5c b1 04 08    	jmp    *0x804b15c
 8048962:	68 e0 00 00 00       	push   $0xe0
 8048967:	e9 20 fe ff ff       	jmp    804878c <_init+0x30>

0804896c <puts@plt>:
 804896c:	ff 25 60 b1 04 08    	jmp    *0x804b160
 8048972:	68 e8 00 00 00       	push   $0xe8
 8048977:	e9 10 fe ff ff       	jmp    804878c <_init+0x30>

0804897c <rand@plt>:
 804897c:	ff 25 64 b1 04 08    	jmp    *0x804b164
 8048982:	68 f0 00 00 00       	push   $0xf0
 8048987:	e9 00 fe ff ff       	jmp    804878c <_init+0x30>

0804898c <munmap@plt>:
 804898c:	ff 25 68 b1 04 08    	jmp    *0x804b168
 8048992:	68 f8 00 00 00       	push   $0xf8
 8048997:	e9 f0 fd ff ff       	jmp    804878c <_init+0x30>

0804899c <gethostbyname@plt>:
 804899c:	ff 25 6c b1 04 08    	jmp    *0x804b16c
 80489a2:	68 00 01 00 00       	push   $0x100
 80489a7:	e9 e0 fd ff ff       	jmp    804878c <_init+0x30>

080489ac <__strdup@plt>:
 80489ac:	ff 25 70 b1 04 08    	jmp    *0x804b170
 80489b2:	68 08 01 00 00       	push   $0x108
 80489b7:	e9 d0 fd ff ff       	jmp    804878c <_init+0x30>

080489bc <exit@plt>:
 80489bc:	ff 25 74 b1 04 08    	jmp    *0x804b174
 80489c2:	68 10 01 00 00       	push   $0x110
 80489c7:	e9 c0 fd ff ff       	jmp    804878c <_init+0x30>

Disassembly of section .text:

080489d0 <_start>:
 80489d0:	31 ed                	xor    %ebp,%ebp
 80489d2:	5e                   	pop    %esi
 80489d3:	89 e1                	mov    %esp,%ecx
 80489d5:	83 e4 f0             	and    $0xfffffff0,%esp
 80489d8:	50                   	push   %eax
 80489d9:	54                   	push   %esp
 80489da:	52                   	push   %edx
 80489db:	68 90 9f 04 08       	push   $0x8049f90
 80489e0:	68 a0 9f 04 08       	push   $0x8049fa0
 80489e5:	51                   	push   %ecx
 80489e6:	56                   	push   %esi
 80489e7:	68 66 8e 04 08       	push   $0x8048e66
 80489ec:	e8 6b fe ff ff       	call   804885c <__libc_start_main@plt>
 80489f1:	f4                   	hlt    
 80489f2:	90                   	nop
 80489f3:	90                   	nop
 80489f4:	90                   	nop
 80489f5:	90                   	nop
 80489f6:	90                   	nop
 80489f7:	90                   	nop
 80489f8:	90                   	nop
 80489f9:	90                   	nop
 80489fa:	90                   	nop
 80489fb:	90                   	nop
 80489fc:	90                   	nop
 80489fd:	90                   	nop
 80489fe:	90                   	nop
 80489ff:	90                   	nop

08048a00 <__do_global_dtors_aux>:
 8048a00:	55                   	push   %ebp
 8048a01:	89 e5                	mov    %esp,%ebp
 8048a03:	53                   	push   %ebx
 8048a04:	83 ec 04             	sub    $0x4,%esp
 8048a07:	80 3d 0c b3 04 08 00 	cmpb   $0x0,0x804b30c
 8048a0e:	75 3f                	jne    8048a4f <__do_global_dtors_aux+0x4f>
 8048a10:	a1 10 b3 04 08       	mov    0x804b310,%eax
 8048a15:	bb 0c b0 04 08       	mov    $0x804b00c,%ebx
 8048a1a:	81 eb 08 b0 04 08    	sub    $0x804b008,%ebx
 8048a20:	c1 fb 02             	sar    $0x2,%ebx
 8048a23:	83 eb 01             	sub    $0x1,%ebx
 8048a26:	39 d8                	cmp    %ebx,%eax
 8048a28:	73 1e                	jae    8048a48 <__do_global_dtors_aux+0x48>
 8048a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048a30:	83 c0 01             	add    $0x1,%eax
 8048a33:	a3 10 b3 04 08       	mov    %eax,0x804b310
 8048a38:	ff 14 85 08 b0 04 08 	call   *0x804b008(,%eax,4)
 8048a3f:	a1 10 b3 04 08       	mov    0x804b310,%eax
 8048a44:	39 d8                	cmp    %ebx,%eax
 8048a46:	72 e8                	jb     8048a30 <__do_global_dtors_aux+0x30>
 8048a48:	c6 05 0c b3 04 08 01 	movb   $0x1,0x804b30c
 8048a4f:	83 c4 04             	add    $0x4,%esp
 8048a52:	5b                   	pop    %ebx
 8048a53:	5d                   	pop    %ebp
 8048a54:	c3                   	ret    
 8048a55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048a60 <frame_dummy>:
 8048a60:	55                   	push   %ebp
 8048a61:	89 e5                	mov    %esp,%ebp
 8048a63:	83 ec 18             	sub    $0x18,%esp
 8048a66:	a1 10 b0 04 08       	mov    0x804b010,%eax
 8048a6b:	85 c0                	test   %eax,%eax
 8048a6d:	74 12                	je     8048a81 <frame_dummy+0x21>
 8048a6f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048a74:	85 c0                	test   %eax,%eax
 8048a76:	74 09                	je     8048a81 <frame_dummy+0x21>
 8048a78:	c7 04 24 10 b0 04 08 	movl   $0x804b010,(%esp)
 8048a7f:	ff d0                	call   *%eax
 8048a81:	c9                   	leave  
 8048a82:	c3                   	ret    
 8048a83:	90                   	nop
 8048a84:	90                   	nop
 8048a85:	90                   	nop
 8048a86:	90                   	nop
 8048a87:	90                   	nop
 8048a88:	90                   	nop
 8048a89:	90                   	nop
 8048a8a:	90                   	nop
 8048a8b:	90                   	nop
 8048a8c:	90                   	nop
 8048a8d:	90                   	nop
 8048a8e:	90                   	nop
 8048a8f:	90                   	nop

08048a90 <usage>:
 8048a90:	55                   	push   %ebp
 8048a91:	89 e5                	mov    %esp,%ebp
 8048a93:	83 ec 18             	sub    $0x18,%esp
 8048a96:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048a9a:	c7 04 24 54 a0 04 08 	movl   $0x804a054,(%esp)
 8048aa1:	e8 56 fe ff ff       	call   80488fc <printf@plt>
 8048aa6:	c7 04 24 78 a0 04 08 	movl   $0x804a078,(%esp)
 8048aad:	e8 ba fe ff ff       	call   804896c <puts@plt>
 8048ab2:	c7 04 24 10 a2 04 08 	movl   $0x804a210,(%esp)
 8048ab9:	e8 ae fe ff ff       	call   804896c <puts@plt>
 8048abe:	c7 04 24 9c a0 04 08 	movl   $0x804a09c,(%esp)
 8048ac5:	e8 a2 fe ff ff       	call   804896c <puts@plt>
 8048aca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048ad1:	e8 e6 fe ff ff       	call   80489bc <exit@plt>

08048ad6 <illegalhandler>:
 8048ad6:	55                   	push   %ebp
 8048ad7:	89 e5                	mov    %esp,%ebp
 8048ad9:	83 ec 18             	sub    $0x18,%esp
 8048adc:	c7 04 24 c0 a0 04 08 	movl   $0x804a0c0,(%esp)
 8048ae3:	e8 84 fe ff ff       	call   804896c <puts@plt>
 8048ae8:	c7 04 24 27 a2 04 08 	movl   $0x804a227,(%esp)
 8048aef:	e8 78 fe ff ff       	call   804896c <puts@plt>
 8048af4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048afb:	e8 bc fe ff ff       	call   80489bc <exit@plt>

08048b00 <seghandler>:
 8048b00:	55                   	push   %ebp
 8048b01:	89 e5                	mov    %esp,%ebp
 8048b03:	83 ec 18             	sub    $0x18,%esp
 8048b06:	c7 04 24 ec a0 04 08 	movl   $0x804a0ec,(%esp)
 8048b0d:	e8 5a fe ff ff       	call   804896c <puts@plt>
 8048b12:	c7 04 24 27 a2 04 08 	movl   $0x804a227,(%esp)
 8048b19:	e8 4e fe ff ff       	call   804896c <puts@plt>
 8048b1e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048b25:	e8 92 fe ff ff       	call   80489bc <exit@plt>

08048b2a <bushandler>:
 8048b2a:	55                   	push   %ebp
 8048b2b:	89 e5                	mov    %esp,%ebp
 8048b2d:	83 ec 18             	sub    $0x18,%esp
 8048b30:	c7 04 24 14 a1 04 08 	movl   $0x804a114,(%esp)
 8048b37:	e8 30 fe ff ff       	call   804896c <puts@plt>
 8048b3c:	c7 04 24 27 a2 04 08 	movl   $0x804a227,(%esp)
 8048b43:	e8 24 fe ff ff       	call   804896c <puts@plt>
 8048b48:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048b4f:	e8 68 fe ff ff       	call   80489bc <exit@plt>

08048b54 <Gets>:
 8048b54:	55                   	push   %ebp
 8048b55:	89 e5                	mov    %esp,%ebp
 8048b57:	57                   	push   %edi
 8048b58:	56                   	push   %esi
 8048b59:	53                   	push   %ebx
 8048b5a:	83 ec 2c             	sub    $0x2c,%esp
 8048b5d:	c7 05 28 b3 04 08 00 	movl   $0x0,0x804b328
 8048b64:	00 00 00 
 8048b67:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8048b6a:	be 4b a3 04 08       	mov    $0x804a34b,%esi
 8048b6f:	eb 4d                	jmp    8048bbe <Gets+0x6a>
 8048b71:	88 45 d8             	mov    %al,-0x28(%ebp)
 8048b74:	88 03                	mov    %al,(%ebx)
 8048b76:	a1 28 b3 04 08       	mov    0x804b328,%eax
 8048b7b:	3d ff 03 00 00       	cmp    $0x3ff,%eax
 8048b80:	7f 39                	jg     8048bbb <Gets+0x67>
 8048b82:	8d 14 40             	lea    (%eax,%eax,2),%edx
 8048b85:	0f b6 4d d8          	movzbl -0x28(%ebp),%ecx
 8048b89:	c0 e9 04             	shr    $0x4,%cl
 8048b8c:	0f be f9             	movsbl %cl,%edi
 8048b8f:	0f b6 3c 3e          	movzbl (%esi,%edi,1),%edi
 8048b93:	89 f9                	mov    %edi,%ecx
 8048b95:	88 8a 40 b3 04 08    	mov    %cl,0x804b340(%edx)
 8048b9b:	0f b6 4d d8          	movzbl -0x28(%ebp),%ecx
 8048b9f:	83 e1 0f             	and    $0xf,%ecx
 8048ba2:	0f b6 0c 0e          	movzbl (%esi,%ecx,1),%ecx
 8048ba6:	88 8a 41 b3 04 08    	mov    %cl,0x804b341(%edx)
 8048bac:	c6 82 42 b3 04 08 20 	movb   $0x20,0x804b342(%edx)
 8048bb3:	83 c0 01             	add    $0x1,%eax
 8048bb6:	a3 28 b3 04 08       	mov    %eax,0x804b328
 8048bbb:	83 c3 01             	add    $0x1,%ebx
 8048bbe:	a1 14 b3 04 08       	mov    0x804b314,%eax
 8048bc3:	89 04 24             	mov    %eax,(%esp)
 8048bc6:	e8 a1 fc ff ff       	call   804886c <_IO_getc@plt>
 8048bcb:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048bce:	74 05                	je     8048bd5 <Gets+0x81>
 8048bd0:	83 f8 0a             	cmp    $0xa,%eax
 8048bd3:	75 9c                	jne    8048b71 <Gets+0x1d>
 8048bd5:	c6 03 00             	movb   $0x0,(%ebx)
 8048bd8:	a1 28 b3 04 08       	mov    0x804b328,%eax
 8048bdd:	c6 84 40 40 b3 04 08 	movb   $0x0,0x804b340(%eax,%eax,2)
 8048be4:	00 
 8048be5:	8b 45 08             	mov    0x8(%ebp),%eax
 8048be8:	83 c4 2c             	add    $0x2c,%esp
 8048beb:	5b                   	pop    %ebx
 8048bec:	5e                   	pop    %esi
 8048bed:	5f                   	pop    %edi
 8048bee:	5d                   	pop    %ebp
 8048bef:	c3                   	ret    

08048bf0 <getbufn>:
 8048bf0:	55                   	push   %ebp
 8048bf1:	89 e5                	mov    %esp,%ebp
 8048bf3:	81 ec 18 02 00 00    	sub    $0x218,%esp
 8048bf9:	8d 85 f8 fd ff ff    	lea    -0x208(%ebp),%eax
 8048bff:	89 04 24             	mov    %eax,(%esp)
 8048c02:	e8 4d ff ff ff       	call   8048b54 <Gets>
 8048c07:	b8 01 00 00 00       	mov    $0x1,%eax
 8048c0c:	c9                   	leave  
 8048c0d:	c3                   	ret    

08048c0e <getbuf>:
 8048c0e:	55                   	push   %ebp
 8048c0f:	89 e5                	mov    %esp,%ebp
 8048c11:	83 ec 38             	sub    $0x38,%esp
 8048c14:	8d 45 d8             	lea    -0x28(%ebp),%eax
 8048c17:	89 04 24             	mov    %eax,(%esp)
 8048c1a:	e8 35 ff ff ff       	call   8048b54 <Gets>
 8048c1f:	b8 01 00 00 00       	mov    $0x1,%eax
 8048c24:	c9                   	leave  
 8048c25:	c3                   	ret    

08048c26 <testn>:
 8048c26:	55                   	push   %ebp
 8048c27:	89 e5                	mov    %esp,%ebp
 8048c29:	83 ec 28             	sub    $0x28,%esp
 8048c2c:	c7 45 f4 ef be ad de 	movl   $0xdeadbeef,-0xc(%ebp)
 8048c33:	e8 b8 ff ff ff       	call   8048bf0 <getbufn>
 8048c38:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c3b:	81 fa ef be ad de    	cmp    $0xdeadbeef,%edx
 8048c41:	74 0e                	je     8048c51 <testn+0x2b>
 8048c43:	c7 04 24 34 a1 04 08 	movl   $0x804a134,(%esp)
 8048c4a:	e8 1d fd ff ff       	call   804896c <puts@plt>
 8048c4f:	eb 36                	jmp    8048c87 <testn+0x61>
 8048c51:	3b 05 18 b3 04 08    	cmp    0x804b318,%eax
 8048c57:	75 1e                	jne    8048c77 <testn+0x51>
 8048c59:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048c5d:	c7 04 24 60 a1 04 08 	movl   $0x804a160,(%esp)
 8048c64:	e8 93 fc ff ff       	call   80488fc <printf@plt>
 8048c69:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 8048c70:	e8 62 05 00 00       	call   80491d7 <validate>
 8048c75:	eb 10                	jmp    8048c87 <testn+0x61>
 8048c77:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048c7b:	c7 04 24 3d a2 04 08 	movl   $0x804a23d,(%esp)
 8048c82:	e8 75 fc ff ff       	call   80488fc <printf@plt>
 8048c87:	c9                   	leave  
 8048c88:	c3                   	ret    

08048c89 <test>:
 8048c89:	55                   	push   %ebp
 8048c8a:	89 e5                	mov    %esp,%ebp
 8048c8c:	83 ec 28             	sub    $0x28,%esp
 8048c8f:	c7 45 f4 ef be ad de 	movl   $0xdeadbeef,-0xc(%ebp)
 8048c96:	e8 73 ff ff ff       	call   8048c0e <getbuf>
 8048c9b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c9e:	81 fa ef be ad de    	cmp    $0xdeadbeef,%edx
 8048ca4:	74 0e                	je     8048cb4 <test+0x2b>
 8048ca6:	c7 04 24 34 a1 04 08 	movl   $0x804a134,(%esp)
 8048cad:	e8 ba fc ff ff       	call   804896c <puts@plt>
 8048cb2:	eb 36                	jmp    8048cea <test+0x61>
 8048cb4:	3b 05 18 b3 04 08    	cmp    0x804b318,%eax
 8048cba:	75 1e                	jne    8048cda <test+0x51>
 8048cbc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048cc0:	c7 04 24 59 a2 04 08 	movl   $0x804a259,(%esp)
 8048cc7:	e8 30 fc ff ff       	call   80488fc <printf@plt>
 8048ccc:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8048cd3:	e8 ff 04 00 00       	call   80491d7 <validate>
 8048cd8:	eb 10                	jmp    8048cea <test+0x61>
 8048cda:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048cde:	c7 04 24 76 a2 04 08 	movl   $0x804a276,(%esp)
 8048ce5:	e8 12 fc ff ff       	call   80488fc <printf@plt>
 8048cea:	c9                   	leave  
 8048ceb:	c3                   	ret    

08048cec <launch>:
 8048cec:	55                   	push   %ebp
 8048ced:	89 e5                	mov    %esp,%ebp
 8048cef:	53                   	push   %ebx
 8048cf0:	83 ec 54             	sub    $0x54,%esp
 8048cf3:	89 c3                	mov    %eax,%ebx
 8048cf5:	8d 45 b8             	lea    -0x48(%ebp),%eax
 8048cf8:	25 f8 3f 00 00       	and    $0x3ff8,%eax
 8048cfd:	01 c2                	add    %eax,%edx
 8048cff:	8d 42 1e             	lea    0x1e(%edx),%eax
 8048d02:	83 e0 f0             	and    $0xfffffff0,%eax
 8048d05:	29 c4                	sub    %eax,%esp
 8048d07:	8d 44 24 1b          	lea    0x1b(%esp),%eax
 8048d0b:	83 e0 f0             	and    $0xfffffff0,%eax
 8048d0e:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048d12:	c7 44 24 04 f4 00 00 	movl   $0xf4,0x4(%esp)
 8048d19:	00 
 8048d1a:	89 04 24             	mov    %eax,(%esp)
 8048d1d:	e8 2a fb ff ff       	call   804884c <memset@plt>
 8048d22:	c7 04 24 91 a2 04 08 	movl   $0x804a291,(%esp)
 8048d29:	e8 ce fb ff ff       	call   80488fc <printf@plt>
 8048d2e:	85 db                	test   %ebx,%ebx
 8048d30:	74 07                	je     8048d39 <launch+0x4d>
 8048d32:	e8 ef fe ff ff       	call   8048c26 <testn>
 8048d37:	eb 0c                	jmp    8048d45 <launch+0x59>
 8048d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048d40:	e8 44 ff ff ff       	call   8048c89 <test>
 8048d45:	83 3d 20 b3 04 08 00 	cmpl   $0x0,0x804b320
 8048d4c:	75 16                	jne    8048d64 <launch+0x78>
 8048d4e:	c7 04 24 27 a2 04 08 	movl   $0x804a227,(%esp)
 8048d55:	e8 12 fc ff ff       	call   804896c <puts@plt>
 8048d5a:	c7 05 20 b3 04 08 00 	movl   $0x0,0x804b320
 8048d61:	00 00 00 
 8048d64:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048d67:	c9                   	leave  
 8048d68:	c3                   	ret    

08048d69 <launcher>:
 8048d69:	55                   	push   %ebp
 8048d6a:	89 e5                	mov    %esp,%ebp
 8048d6c:	53                   	push   %ebx
 8048d6d:	83 ec 24             	sub    $0x24,%esp
 8048d70:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d73:	a3 2c b3 04 08       	mov    %eax,0x804b32c
 8048d78:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048d7b:	a3 30 b3 04 08       	mov    %eax,0x804b330
 8048d80:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
 8048d87:	00 
 8048d88:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
 8048d8f:	00 
 8048d90:	c7 44 24 0c 22 01 00 	movl   $0x122,0xc(%esp)
 8048d97:	00 
 8048d98:	c7 44 24 08 07 00 00 	movl   $0x7,0x8(%esp)
 8048d9f:	00 
 8048da0:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
 8048da7:	00 
 8048da8:	c7 04 24 00 60 58 55 	movl   $0x55586000,(%esp)
 8048daf:	e8 28 fa ff ff       	call   80487dc <mmap@plt>
 8048db4:	89 c3                	mov    %eax,%ebx
 8048db6:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048db9:	75 31                	jne    8048dec <launcher+0x83>
 8048dbb:	a1 00 b3 04 08       	mov    0x804b300,%eax
 8048dc0:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048dc4:	c7 44 24 08 23 00 00 	movl   $0x23,0x8(%esp)
 8048dcb:	00 
 8048dcc:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8048dd3:	00 
 8048dd4:	c7 04 24 80 a1 04 08 	movl   $0x804a180,(%esp)
 8048ddb:	e8 5c fb ff ff       	call   804893c <fwrite@plt>
 8048de0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048de7:	e8 d0 fb ff ff       	call   80489bc <exit@plt>
 8048dec:	8d 90 f8 ff 0f 00    	lea    0xffff8(%eax),%edx
 8048df2:	89 15 44 bf 04 08    	mov    %edx,0x804bf44
 8048df8:	89 e0                	mov    %esp,%eax
 8048dfa:	89 d4                	mov    %edx,%esp
 8048dfc:	89 c2                	mov    %eax,%edx
 8048dfe:	89 15 34 b3 04 08    	mov    %edx,0x804b334
 8048e04:	8b 15 30 b3 04 08    	mov    0x804b330,%edx
 8048e0a:	a1 2c b3 04 08       	mov    0x804b32c,%eax
 8048e0f:	e8 d8 fe ff ff       	call   8048cec <launch>
 8048e14:	a1 34 b3 04 08       	mov    0x804b334,%eax
 8048e19:	89 c4                	mov    %eax,%esp
 8048e1b:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
 8048e22:	00 
 8048e23:	89 1c 24             	mov    %ebx,(%esp)
 8048e26:	e8 61 fb ff ff       	call   804898c <munmap@plt>
 8048e2b:	85 c0                	test   %eax,%eax
 8048e2d:	79 31                	jns    8048e60 <launcher+0xf7>
 8048e2f:	a1 00 b3 04 08       	mov    0x804b300,%eax
 8048e34:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048e38:	c7 44 24 08 1d 00 00 	movl   $0x1d,0x8(%esp)
 8048e3f:	00 
 8048e40:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8048e47:	00 
 8048e48:	c7 04 24 9e a2 04 08 	movl   $0x804a29e,(%esp)
 8048e4f:	e8 e8 fa ff ff       	call   804893c <fwrite@plt>
 8048e54:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048e5b:	e8 5c fb ff ff       	call   80489bc <exit@plt>
 8048e60:	83 c4 24             	add    $0x24,%esp
 8048e63:	5b                   	pop    %ebx
 8048e64:	5d                   	pop    %ebp
 8048e65:	c3                   	ret    

08048e66 <main>:
 8048e66:	55                   	push   %ebp
 8048e67:	89 e5                	mov    %esp,%ebp
 8048e69:	83 e4 f0             	and    $0xfffffff0,%esp
 8048e6c:	57                   	push   %edi
 8048e6d:	56                   	push   %esi
 8048e6e:	53                   	push   %ebx
 8048e6f:	83 ec 34             	sub    $0x34,%esp
 8048e72:	8b 75 08             	mov    0x8(%ebp),%esi
 8048e75:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8048e78:	c7 44 24 04 00 8b 04 	movl   $0x8048b00,0x4(%esp)
 8048e7f:	08 
 8048e80:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
 8048e87:	e8 70 f9 ff ff       	call   80487fc <signal@plt>
 8048e8c:	c7 44 24 04 2a 8b 04 	movl   $0x8048b2a,0x4(%esp)
 8048e93:	08 
 8048e94:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
 8048e9b:	e8 5c f9 ff ff       	call   80487fc <signal@plt>
 8048ea0:	c7 44 24 04 d6 8a 04 	movl   $0x8048ad6,0x4(%esp)
 8048ea7:	08 
 8048ea8:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 8048eaf:	e8 48 f9 ff ff       	call   80487fc <signal@plt>
 8048eb4:	e8 94 04 00 00       	call   804934d <initialize_bomb>
 8048eb9:	a1 04 b3 04 08       	mov    0x804b304,%eax
 8048ebe:	a3 14 b3 04 08       	mov    %eax,0x804b314
 8048ec3:	bf 01 00 00 00       	mov    $0x1,%edi
 8048ec8:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 8048ecf:	00 
 8048ed0:	e9 d4 00 00 00       	jmp    8048fa9 <main+0x143>
 8048ed5:	3c 68                	cmp    $0x68,%al
 8048ed7:	74 3b                	je     8048f14 <main+0xae>
 8048ed9:	3c 68                	cmp    $0x68,%al
 8048edb:	7f 0b                	jg     8048ee8 <main+0x82>
 8048edd:	3c 66                	cmp    $0x66,%al
 8048edf:	90                   	nop
 8048ee0:	0f 85 bc 00 00 00    	jne    8048fa2 <main+0x13c>
 8048ee6:	eb 7e                	jmp    8048f66 <main+0x100>
 8048ee8:	3c 6e                	cmp    $0x6e,%al
 8048eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048ef0:	74 10                	je     8048f02 <main+0x9c>
 8048ef2:	3c 74                	cmp    $0x74,%al
 8048ef4:	0f 85 a8 00 00 00    	jne    8048fa2 <main+0x13c>
 8048efa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048f00:	eb 1e                	jmp    8048f20 <main+0xba>
 8048f02:	bf 05 00 00 00       	mov    $0x5,%edi
 8048f07:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
 8048f0e:	00 
 8048f0f:	e9 95 00 00 00       	jmp    8048fa9 <main+0x143>
 8048f14:	8b 03                	mov    (%ebx),%eax
 8048f16:	e8 75 fb ff ff       	call   8048a90 <usage>
 8048f1b:	e9 89 00 00 00       	jmp    8048fa9 <main+0x143>
 8048f20:	a1 08 b3 04 08       	mov    0x804b308,%eax
 8048f25:	89 04 24             	mov    %eax,(%esp)
 8048f28:	e8 7f fa ff ff       	call   80489ac <__strdup@plt>
 8048f2d:	a3 1c b3 04 08       	mov    %eax,0x804b31c
 8048f32:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f36:	c7 04 24 bc a2 04 08 	movl   $0x804a2bc,(%esp)
 8048f3d:	e8 ba f9 ff ff       	call   80488fc <printf@plt>
 8048f42:	a1 1c b3 04 08       	mov    0x804b31c,%eax
 8048f47:	89 04 24             	mov    %eax,(%esp)
 8048f4a:	e8 fe 0f 00 00       	call   8049f4d <gencookie>
 8048f4f:	a3 18 b3 04 08       	mov    %eax,0x804b318
 8048f54:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f58:	c7 04 24 c8 a2 04 08 	movl   $0x804a2c8,(%esp)
 8048f5f:	e8 98 f9 ff ff       	call   80488fc <printf@plt>
 8048f64:	eb 43                	jmp    8048fa9 <main+0x143>
 8048f66:	c7 44 24 04 d6 a2 04 	movl   $0x804a2d6,0x4(%esp)
 8048f6d:	08 
 8048f6e:	a1 08 b3 04 08       	mov    0x804b308,%eax
 8048f73:	89 04 24             	mov    %eax,(%esp)
 8048f76:	e8 51 f9 ff ff       	call   80488cc <fopen@plt>
 8048f7b:	a3 14 b3 04 08       	mov    %eax,0x804b314
 8048f80:	85 c0                	test   %eax,%eax
 8048f82:	75 25                	jne    8048fa9 <main+0x143>
 8048f84:	a1 08 b3 04 08       	mov    0x804b308,%eax
 8048f89:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f8d:	c7 04 24 d8 a2 04 08 	movl   $0x804a2d8,(%esp)
 8048f94:	e8 63 f9 ff ff       	call   80488fc <printf@plt>
 8048f99:	8b 03                	mov    (%ebx),%eax
 8048f9b:	e8 f0 fa ff ff       	call   8048a90 <usage>
 8048fa0:	eb 07                	jmp    8048fa9 <main+0x143>
 8048fa2:	8b 03                	mov    (%ebx),%eax
 8048fa4:	e8 e7 fa ff ff       	call   8048a90 <usage>
 8048fa9:	c7 44 24 08 ed a2 04 	movl   $0x804a2ed,0x8(%esp)
 8048fb0:	08 
 8048fb1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8048fb5:	89 34 24             	mov    %esi,(%esp)
 8048fb8:	e8 ef f8 ff ff       	call   80488ac <getopt@plt>
 8048fbd:	3c ff                	cmp    $0xff,%al
 8048fbf:	0f 85 10 ff ff ff    	jne    8048ed5 <main+0x6f>
 8048fc5:	83 3d 1c b3 04 08 00 	cmpl   $0x0,0x804b31c
 8048fcc:	75 13                	jne    8048fe1 <main+0x17b>
 8048fce:	c7 04 24 a4 a1 04 08 	movl   $0x804a1a4,(%esp)
 8048fd5:	e8 92 f9 ff ff       	call   804896c <puts@plt>
 8048fda:	8b 03                	mov    (%ebx),%eax
 8048fdc:	e8 af fa ff ff       	call   8048a90 <usage>
 8048fe1:	a1 18 b3 04 08       	mov    0x804b318,%eax
 8048fe6:	89 04 24             	mov    %eax,(%esp)
 8048fe9:	e8 2e f9 ff ff       	call   804891c <srandom@plt>
 8048fee:	e8 f9 f7 ff ff       	call   80487ec <random@plt>
 8048ff3:	25 f8 0f 00 00       	and    $0xff8,%eax
 8048ff8:	89 44 24 28          	mov    %eax,0x28(%esp)
 8048ffc:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
 8049000:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
 8049007:	00 
 8049008:	89 3c 24             	mov    %edi,(%esp)
 804900b:	e8 1c f8 ff ff       	call   804882c <calloc@plt>
 8049010:	89 c6                	mov    %eax,%esi
 8049012:	89 44 24 20          	mov    %eax,0x20(%esp)
 8049016:	8d 47 fe             	lea    -0x2(%edi),%eax
 8049019:	89 44 24 24          	mov    %eax,0x24(%esp)
 804901d:	85 c0                	test   %eax,%eax
 804901f:	7e 21                	jle    8049042 <main+0x1dc>
 8049021:	bb 00 00 00 00       	mov    $0x0,%ebx
 8049026:	89 7c 24 18          	mov    %edi,0x18(%esp)
 804902a:	89 c7                	mov    %eax,%edi
 804902c:	e8 bb f7 ff ff       	call   80487ec <random@plt>
 8049031:	83 e0 38             	and    $0x38,%eax
 8049034:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
 8049037:	83 c3 01             	add    $0x1,%ebx
 804903a:	39 fb                	cmp    %edi,%ebx
 804903c:	7c ee                	jl     804902c <main+0x1c6>
 804903e:	8b 7c 24 18          	mov    0x18(%esp),%edi
 8049042:	83 ff 01             	cmp    $0x1,%edi
 8049045:	7e 10                	jle    8049057 <main+0x1f1>
 8049047:	8b 54 24 1c          	mov    0x1c(%esp),%edx
 804904b:	8b 44 24 20          	mov    0x20(%esp),%eax
 804904f:	c7 44 90 f8 38 00 00 	movl   $0x38,-0x8(%eax,%edx,4)
 8049056:	00 
 8049057:	8b 54 24 1c          	mov    0x1c(%esp),%edx
 804905b:	8b 44 24 20          	mov    0x20(%esp),%eax
 804905f:	c7 44 90 fc 00 00 00 	movl   $0x0,-0x4(%eax,%edx,4)
 8049066:	00 
 8049067:	85 ff                	test   %edi,%edi
 8049069:	7e 23                	jle    804908e <main+0x228>
 804906b:	bb 00 00 00 00       	mov    $0x0,%ebx
 8049070:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049074:	03 04 9e             	add    (%esi,%ebx,4),%eax
 8049077:	89 44 24 04          	mov    %eax,0x4(%esp)
 804907b:	8b 54 24 2c          	mov    0x2c(%esp),%edx
 804907f:	89 14 24             	mov    %edx,(%esp)
 8049082:	e8 e2 fc ff ff       	call   8048d69 <launcher>
 8049087:	83 c3 01             	add    $0x1,%ebx
 804908a:	39 df                	cmp    %ebx,%edi
 804908c:	7f e2                	jg     8049070 <main+0x20a>
 804908e:	b8 00 00 00 00       	mov    $0x0,%eax
 8049093:	83 c4 34             	add    $0x34,%esp
 8049096:	5b                   	pop    %ebx
 8049097:	5e                   	pop    %esi
 8049098:	5f                   	pop    %edi
 8049099:	89 ec                	mov    %ebp,%esp
 804909b:	5d                   	pop    %ebp
 804909c:	c3                   	ret    

0804909d <bang>:
 804909d:	55                   	push   %ebp
 804909e:	89 e5                	mov    %esp,%ebp
 80490a0:	83 ec 18             	sub    $0x18,%esp
 80490a3:	a1 24 b3 04 08       	mov    0x804b324,%eax
 80490a8:	3b 05 18 b3 04 08    	cmp    0x804b318,%eax
 80490ae:	75 1e                	jne    80490ce <bang+0x31>
 80490b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 80490b4:	c7 04 24 c8 a1 04 08 	movl   $0x804a1c8,(%esp)
 80490bb:	e8 3c f8 ff ff       	call   80488fc <printf@plt>
 80490c0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80490c7:	e8 0b 01 00 00       	call   80491d7 <validate>
 80490cc:	eb 10                	jmp    80490de <bang+0x41>
 80490ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 80490d2:	c7 04 24 f4 a2 04 08 	movl   $0x804a2f4,(%esp)
 80490d9:	e8 1e f8 ff ff       	call   80488fc <printf@plt>
 80490de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80490e5:	e8 d2 f8 ff ff       	call   80489bc <exit@plt>

080490ea <fizz>:
 80490ea:	55                   	push   %ebp
 80490eb:	89 e5                	mov    %esp,%ebp
 80490ed:	83 ec 18             	sub    $0x18,%esp
 80490f0:	8b 45 08             	mov    0x8(%ebp),%eax
 80490f3:	3b 05 18 b3 04 08    	cmp    0x804b318,%eax
 80490f9:	75 1e                	jne    8049119 <fizz+0x2f>
 80490fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 80490ff:	c7 04 24 12 a3 04 08 	movl   $0x804a312,(%esp)
 8049106:	e8 f1 f7 ff ff       	call   80488fc <printf@plt>
 804910b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049112:	e8 c0 00 00 00       	call   80491d7 <validate>
 8049117:	eb 10                	jmp    8049129 <fizz+0x3f>
 8049119:	89 44 24 04          	mov    %eax,0x4(%esp)
 804911d:	c7 04 24 f0 a1 04 08 	movl   $0x804a1f0,(%esp)
 8049124:	e8 d3 f7 ff ff       	call   80488fc <printf@plt>
 8049129:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049130:	e8 87 f8 ff ff       	call   80489bc <exit@plt>

08049135 <smoke>:
 8049135:	55                   	push   %ebp
 8049136:	89 e5                	mov    %esp,%ebp
 8049138:	83 ec 18             	sub    $0x18,%esp
 804913b:	c7 04 24 30 a3 04 08 	movl   $0x804a330,(%esp)
 8049142:	e8 25 f8 ff ff       	call   804896c <puts@plt>
 8049147:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804914e:	e8 84 00 00 00       	call   80491d7 <validate>
 8049153:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804915a:	e8 5d f8 ff ff       	call   80489bc <exit@plt>
 804915f:	90                   	nop

08049160 <server_check>:
 8049160:	55                   	push   %ebp
 8049161:	89 e5                	mov    %esp,%ebp
 8049163:	83 ec 18             	sub    $0x18,%esp
 8049166:	8b 45 08             	mov    0x8(%ebp),%eax
 8049169:	83 3d 1c b3 04 08 00 	cmpl   $0x0,0x804b31c
 8049170:	75 0e                	jne    8049180 <server_check+0x20>
 8049172:	c7 04 24 5c a3 04 08 	movl   $0x804a35c,(%esp)
 8049179:	e8 ee f7 ff ff       	call   804896c <puts@plt>
 804917e:	eb 55                	jmp    80491d5 <server_check+0x75>
 8049180:	83 f8 04             	cmp    $0x4,%eax
 8049183:	76 0e                	jbe    8049193 <server_check+0x33>
 8049185:	c7 04 24 88 a3 04 08 	movl   $0x804a388,(%esp)
 804918c:	e8 db f7 ff ff       	call   804896c <puts@plt>
 8049191:	eb 42                	jmp    80491d5 <server_check+0x75>
 8049193:	c7 05 20 b3 04 08 01 	movl   $0x1,0x804b320
 804919a:	00 00 00 
 804919d:	b9 e4 b2 04 08       	mov    $0x804b2e4,%ecx
 80491a2:	8b 14 81             	mov    (%ecx,%eax,4),%edx
 80491a5:	83 ea 01             	sub    $0x1,%edx
 80491a8:	89 14 81             	mov    %edx,(%ecx,%eax,4)
 80491ab:	85 d2                	test   %edx,%edx
 80491ad:	7e 0e                	jle    80491bd <server_check+0x5d>
 80491af:	c7 04 24 f1 a4 04 08 	movl   $0x804a4f1,(%esp)
 80491b6:	e8 b1 f7 ff ff       	call   804896c <puts@plt>
 80491bb:	eb 18                	jmp    80491d5 <server_check+0x75>
 80491bd:	c7 04 24 fc a4 04 08 	movl   $0x804a4fc,(%esp)
 80491c4:	e8 a3 f7 ff ff       	call   804896c <puts@plt>
 80491c9:	c7 04 24 05 a5 04 08 	movl   $0x804a505,(%esp)
 80491d0:	e8 97 f7 ff ff       	call   804896c <puts@plt>
 80491d5:	c9                   	leave  
 80491d6:	c3                   	ret    

080491d7 <validate>:
 80491d7:	55                   	push   %ebp
 80491d8:	89 e5                	mov    %esp,%ebp
 80491da:	81 ec 28 40 00 00    	sub    $0x4028,%esp
 80491e0:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 80491e3:	89 7d fc             	mov    %edi,-0x4(%ebp)
 80491e6:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80491e9:	83 3d 1c b3 04 08 00 	cmpl   $0x0,0x804b31c
 80491f0:	75 11                	jne    8049203 <validate+0x2c>
 80491f2:	c7 04 24 5c a3 04 08 	movl   $0x804a35c,(%esp)
 80491f9:	e8 6e f7 ff ff       	call   804896c <puts@plt>
 80491fe:	e9 0e 01 00 00       	jmp    8049311 <validate+0x13a>
 8049203:	83 fb 04             	cmp    $0x4,%ebx
 8049206:	76 11                	jbe    8049219 <validate+0x42>
 8049208:	c7 04 24 88 a3 04 08 	movl   $0x804a388,(%esp)
 804920f:	e8 58 f7 ff ff       	call   804896c <puts@plt>
 8049214:	e9 f8 00 00 00       	jmp    8049311 <validate+0x13a>
 8049219:	c7 05 20 b3 04 08 01 	movl   $0x1,0x804b320
 8049220:	00 00 00 
 8049223:	ba e4 b2 04 08       	mov    $0x804b2e4,%edx
 8049228:	8b 04 9a             	mov    (%edx,%ebx,4),%eax
 804922b:	83 e8 01             	sub    $0x1,%eax
 804922e:	89 04 9a             	mov    %eax,(%edx,%ebx,4)
 8049231:	85 c0                	test   %eax,%eax
 8049233:	7e 11                	jle    8049246 <validate+0x6f>
 8049235:	c7 04 24 f1 a4 04 08 	movl   $0x804a4f1,(%esp)
 804923c:	e8 2b f7 ff ff       	call   804896c <puts@plt>
 8049241:	e9 cb 00 00 00       	jmp    8049311 <validate+0x13a>
 8049246:	c7 04 24 0f a5 04 08 	movl   $0x804a50f,(%esp)
 804924d:	e8 1a f7 ff ff       	call   804896c <puts@plt>
 8049252:	a1 e0 b2 04 08       	mov    0x804b2e0,%eax
 8049257:	83 f8 01             	cmp    $0x1,%eax
 804925a:	0f 85 a5 00 00 00    	jne    8049305 <validate+0x12e>
 8049260:	bf 40 b3 04 08       	mov    $0x804b340,%edi
 8049265:	b8 00 00 00 00       	mov    $0x0,%eax
 804926a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 804926f:	f2 ae                	repnz scas %es:(%edi),%al
 8049271:	f7 d1                	not    %ecx
 8049273:	83 c1 1f             	add    $0x1f,%ecx
 8049276:	81 f9 00 20 00 00    	cmp    $0x2000,%ecx
 804927c:	76 11                	jbe    804928f <validate+0xb8>
 804927e:	c7 04 24 b0 a3 04 08 	movl   $0x804a3b0,(%esp)
 8049285:	e8 e2 f6 ff ff       	call   804896c <puts@plt>
 804928a:	e9 82 00 00 00       	jmp    8049311 <validate+0x13a>
 804928f:	c7 44 24 10 40 b3 04 	movl   $0x804b340,0x10(%esp)
 8049296:	08 
 8049297:	a1 18 b3 04 08       	mov    0x804b318,%eax
 804929c:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80492a0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 80492a4:	c7 44 24 04 15 a5 04 	movl   $0x804a515,0x4(%esp)
 80492ab:	08 
 80492ac:	8d 9d f8 df ff ff    	lea    -0x2008(%ebp),%ebx
 80492b2:	89 1c 24             	mov    %ebx,(%esp)
 80492b5:	e8 f2 f4 ff ff       	call   80487ac <sprintf@plt>
 80492ba:	8d 85 f8 bf ff ff    	lea    -0x4008(%ebp),%eax
 80492c0:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80492c4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 80492cb:	00 
 80492cc:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80492d0:	a1 1c b3 04 08       	mov    0x804b31c,%eax
 80492d5:	89 04 24             	mov    %eax,(%esp)
 80492d8:	e8 59 0b 00 00       	call   8049e36 <driver_post>
 80492dd:	85 c0                	test   %eax,%eax
 80492df:	75 0e                	jne    80492ef <validate+0x118>
 80492e1:	c7 04 24 e0 a3 04 08 	movl   $0x804a3e0,(%esp)
 80492e8:	e8 7f f6 ff ff       	call   804896c <puts@plt>
 80492ed:	eb 16                	jmp    8049305 <validate+0x12e>
 80492ef:	8d 85 f8 bf ff ff    	lea    -0x4008(%ebp),%eax
 80492f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 80492f9:	c7 04 24 10 a4 04 08 	movl   $0x804a410,(%esp)
 8049300:	e8 f7 f5 ff ff       	call   80488fc <printf@plt>
 8049305:	c7 04 24 1e a5 04 08 	movl   $0x804a51e,(%esp)
 804930c:	e8 5b f6 ff ff       	call   804896c <puts@plt>
 8049311:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 8049314:	8b 7d fc             	mov    -0x4(%ebp),%edi
 8049317:	89 ec                	mov    %ebp,%esp
 8049319:	5d                   	pop    %ebp
 804931a:	c3                   	ret    

0804931b <alarmhandler>:
 804931b:	55                   	push   %ebp
 804931c:	89 e5                	mov    %esp,%ebp
 804931e:	83 ec 18             	sub    $0x18,%esp
 8049321:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
 8049328:	00 
 8049329:	c7 04 24 50 a4 04 08 	movl   $0x804a450,(%esp)
 8049330:	e8 c7 f5 ff ff       	call   80488fc <printf@plt>
 8049335:	c7 04 24 27 a2 04 08 	movl   $0x804a227,(%esp)
 804933c:	e8 2b f6 ff ff       	call   804896c <puts@plt>
 8049341:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049348:	e8 6f f6 ff ff       	call   80489bc <exit@plt>

0804934d <initialize_bomb>:
 804934d:	55                   	push   %ebp
 804934e:	89 e5                	mov    %esp,%ebp
 8049350:	81 ec 68 20 00 00    	sub    $0x2068,%esp
 8049356:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 8049359:	89 75 f8             	mov    %esi,-0x8(%ebp)
 804935c:	89 7d fc             	mov    %edi,-0x4(%ebp)
 804935f:	a1 e0 b2 04 08       	mov    0x804b2e0,%eax
 8049364:	83 f8 01             	cmp    $0x1,%eax
 8049367:	0f 85 d4 00 00 00    	jne    8049441 <initialize_bomb+0xf4>
 804936d:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
 8049374:	00 
 8049375:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8049378:	89 04 24             	mov    %eax,(%esp)
 804937b:	e8 dc f5 ff ff       	call   804895c <gethostname@plt>
 8049380:	85 c0                	test   %eax,%eax
 8049382:	75 1b                	jne    804939f <initialize_bomb+0x52>
 8049384:	a1 a0 b1 04 08       	mov    0x804b1a0,%eax
 8049389:	bb 00 00 00 00       	mov    $0x0,%ebx
 804938e:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8049391:	bf a0 b1 04 08       	mov    $0x804b1a0,%edi
 8049396:	85 c0                	test   %eax,%eax
 8049398:	75 1d                	jne    80493b7 <initialize_bomb+0x6a>
 804939a:	e9 8a 00 00 00       	jmp    8049429 <initialize_bomb+0xdc>
 804939f:	c7 04 24 84 a4 04 08 	movl   $0x804a484,(%esp)
 80493a6:	e8 c1 f5 ff ff       	call   804896c <puts@plt>
 80493ab:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80493b2:	e8 05 f6 ff ff       	call   80489bc <exit@plt>
 80493b7:	89 74 24 04          	mov    %esi,0x4(%esp)
 80493bb:	89 04 24             	mov    %eax,(%esp)
 80493be:	e8 49 f5 ff ff       	call   804890c <strcasecmp@plt>
 80493c3:	85 c0                	test   %eax,%eax
 80493c5:	74 0c                	je     80493d3 <initialize_bomb+0x86>
 80493c7:	83 c3 01             	add    $0x1,%ebx
 80493ca:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
 80493cd:	85 c0                	test   %eax,%eax
 80493cf:	75 e6                	jne    80493b7 <initialize_bomb+0x6a>
 80493d1:	eb 56                	jmp    8049429 <initialize_bomb+0xdc>
 80493d3:	8d 85 a8 df ff ff    	lea    -0x2058(%ebp),%eax
 80493d9:	89 04 24             	mov    %eax,(%esp)
 80493dc:	e8 6f 00 00 00       	call   8049450 <init_driver>
 80493e1:	85 c0                	test   %eax,%eax
 80493e3:	79 22                	jns    8049407 <initialize_bomb+0xba>
 80493e5:	8d 85 a8 df ff ff    	lea    -0x2058(%ebp),%eax
 80493eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 80493ef:	c7 04 24 28 a5 04 08 	movl   $0x804a528,(%esp)
 80493f6:	e8 01 f5 ff ff       	call   80488fc <printf@plt>
 80493fb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049402:	e8 b5 f5 ff ff       	call   80489bc <exit@plt>
 8049407:	c7 44 24 04 1b 93 04 	movl   $0x804931b,0x4(%esp)
 804940e:	08 
 804940f:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 8049416:	e8 e1 f3 ff ff       	call   80487fc <signal@plt>
 804941b:	c7 04 24 58 02 00 00 	movl   $0x258,(%esp)
 8049422:	e8 b5 f4 ff ff       	call   80488dc <alarm@plt>
 8049427:	eb 18                	jmp    8049441 <initialize_bomb+0xf4>
 8049429:	c7 04 24 bc a4 04 08 	movl   $0x804a4bc,(%esp)
 8049430:	e8 37 f5 ff ff       	call   804896c <puts@plt>
 8049435:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 804943c:	e8 7b f5 ff ff       	call   80489bc <exit@plt>
 8049441:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 8049444:	8b 75 f8             	mov    -0x8(%ebp),%esi
 8049447:	8b 7d fc             	mov    -0x4(%ebp),%edi
 804944a:	89 ec                	mov    %ebp,%esp
 804944c:	5d                   	pop    %ebp
 804944d:	c3                   	ret    
 804944e:	90                   	nop
 804944f:	90                   	nop

08049450 <init_driver>:
 8049450:	55                   	push   %ebp
 8049451:	89 e5                	mov    %esp,%ebp
 8049453:	57                   	push   %edi
 8049454:	56                   	push   %esi
 8049455:	53                   	push   %ebx
 8049456:	83 ec 2c             	sub    $0x2c,%esp
 8049459:	8b 7d 08             	mov    0x8(%ebp),%edi
 804945c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049463:	00 
 8049464:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
 804946b:	e8 8c f3 ff ff       	call   80487fc <signal@plt>
 8049470:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049477:	00 
 8049478:	c7 04 24 1d 00 00 00 	movl   $0x1d,(%esp)
 804947f:	e8 78 f3 ff ff       	call   80487fc <signal@plt>
 8049484:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804948b:	00 
 804948c:	c7 04 24 1d 00 00 00 	movl   $0x1d,(%esp)
 8049493:	e8 64 f3 ff ff       	call   80487fc <signal@plt>
 8049498:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 804949f:	00 
 80494a0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80494a7:	00 
 80494a8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80494af:	e8 d8 f3 ff ff       	call   804888c <socket@plt>
 80494b4:	89 c6                	mov    %eax,%esi
 80494b6:	85 c0                	test   %eax,%eax
 80494b8:	79 4e                	jns    8049508 <init_driver+0xb8>
 80494ba:	c7 07 45 72 72 6f    	movl   $0x6f727245,(%edi)
 80494c0:	c7 47 04 72 3a 20 43 	movl   $0x43203a72,0x4(%edi)
 80494c7:	c7 47 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%edi)
 80494ce:	c7 47 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%edi)
 80494d5:	c7 47 10 61 62 6c 65 	movl   $0x656c6261,0x10(%edi)
 80494dc:	c7 47 14 20 74 6f 20 	movl   $0x206f7420,0x14(%edi)
 80494e3:	c7 47 18 63 72 65 61 	movl   $0x61657263,0x18(%edi)
 80494ea:	c7 47 1c 74 65 20 73 	movl   $0x73206574,0x1c(%edi)
 80494f1:	c7 47 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%edi)
 80494f8:	66 c7 47 24 74 00    	movw   $0x74,0x24(%edi)
 80494fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049503:	e9 3b 01 00 00       	jmp    8049643 <init_driver+0x1f3>
 8049508:	c7 04 24 9e a5 04 08 	movl   $0x804a59e,(%esp)
 804950f:	e8 88 f4 ff ff       	call   804899c <gethostbyname@plt>
 8049514:	85 c0                	test   %eax,%eax
 8049516:	75 68                	jne    8049580 <init_driver+0x130>
 8049518:	c7 07 45 72 72 6f    	movl   $0x6f727245,(%edi)
 804951e:	c7 47 04 72 3a 20 44 	movl   $0x44203a72,0x4(%edi)
 8049525:	c7 47 08 4e 53 20 69 	movl   $0x6920534e,0x8(%edi)
 804952c:	c7 47 0c 73 20 75 6e 	movl   $0x6e752073,0xc(%edi)
 8049533:	c7 47 10 61 62 6c 65 	movl   $0x656c6261,0x10(%edi)
 804953a:	c7 47 14 20 74 6f 20 	movl   $0x206f7420,0x14(%edi)
 8049541:	c7 47 18 72 65 73 6f 	movl   $0x6f736572,0x18(%edi)
 8049548:	c7 47 1c 6c 76 65 20 	movl   $0x2065766c,0x1c(%edi)
 804954f:	c7 47 20 73 65 72 76 	movl   $0x76726573,0x20(%edi)
 8049556:	c7 47 24 65 72 20 61 	movl   $0x61207265,0x24(%edi)
 804955d:	c7 47 28 64 64 72 65 	movl   $0x65726464,0x28(%edi)
 8049564:	66 c7 47 2c 73 73    	movw   $0x7373,0x2c(%edi)
 804956a:	c6 47 2e 00          	movb   $0x0,0x2e(%edi)
 804956e:	89 34 24             	mov    %esi,(%esp)
 8049571:	e8 b6 f3 ff ff       	call   804892c <close@plt>
 8049576:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804957b:	e9 c3 00 00 00       	jmp    8049643 <init_driver+0x1f3>
 8049580:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 8049583:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 8049589:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 8049590:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 8049597:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
 804959e:	66 c7 45 d8 02 00    	movw   $0x2,-0x28(%ebp)
 80495a4:	8b 50 0c             	mov    0xc(%eax),%edx
 80495a7:	89 54 24 08          	mov    %edx,0x8(%esp)
 80495ab:	8d 55 dc             	lea    -0x24(%ebp),%edx
 80495ae:	89 54 24 04          	mov    %edx,0x4(%esp)
 80495b2:	8b 40 10             	mov    0x10(%eax),%eax
 80495b5:	8b 00                	mov    (%eax),%eax
 80495b7:	89 04 24             	mov    %eax,(%esp)
 80495ba:	e8 dd f2 ff ff       	call   804889c <bcopy@plt>
 80495bf:	66 c7 45 da 00 51    	movw   $0x5100,-0x26(%ebp)
 80495c5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 80495cc:	00 
 80495cd:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80495d1:	89 34 24             	mov    %esi,(%esp)
 80495d4:	e8 f3 f1 ff ff       	call   80487cc <connect@plt>
 80495d9:	85 c0                	test   %eax,%eax
 80495db:	79 50                	jns    804962d <init_driver+0x1dd>
 80495dd:	c7 07 45 72 72 6f    	movl   $0x6f727245,(%edi)
 80495e3:	c7 47 04 72 3a 20 55 	movl   $0x55203a72,0x4(%edi)
 80495ea:	c7 47 08 6e 61 62 6c 	movl   $0x6c62616e,0x8(%edi)
 80495f1:	c7 47 0c 65 20 74 6f 	movl   $0x6f742065,0xc(%edi)
 80495f8:	c7 47 10 20 63 6f 6e 	movl   $0x6e6f6320,0x10(%edi)
 80495ff:	c7 47 14 6e 65 63 74 	movl   $0x7463656e,0x14(%edi)
 8049606:	c7 47 18 20 74 6f 20 	movl   $0x206f7420,0x18(%edi)
 804960d:	c7 47 1c 73 65 72 76 	movl   $0x76726573,0x1c(%edi)
 8049614:	66 c7 47 20 65 72    	movw   $0x7265,0x20(%edi)
 804961a:	c6 47 22 00          	movb   $0x0,0x22(%edi)
 804961e:	89 34 24             	mov    %esi,(%esp)
 8049621:	e8 06 f3 ff ff       	call   804892c <close@plt>
 8049626:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804962b:	eb 16                	jmp    8049643 <init_driver+0x1f3>
 804962d:	89 34 24             	mov    %esi,(%esp)
 8049630:	e8 f7 f2 ff ff       	call   804892c <close@plt>
 8049635:	66 c7 07 4f 4b       	movw   $0x4b4f,(%edi)
 804963a:	c6 47 02 00          	movb   $0x0,0x2(%edi)
 804963e:	b8 00 00 00 00       	mov    $0x0,%eax
 8049643:	83 c4 2c             	add    $0x2c,%esp
 8049646:	5b                   	pop    %ebx
 8049647:	5e                   	pop    %esi
 8049648:	5f                   	pop    %edi
 8049649:	5d                   	pop    %ebp
 804964a:	c3                   	ret    

0804964b <init_timeout>:
 804964b:	55                   	push   %ebp
 804964c:	89 e5                	mov    %esp,%ebp
 804964e:	53                   	push   %ebx
 804964f:	83 ec 14             	sub    $0x14,%esp
 8049652:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049655:	85 db                	test   %ebx,%ebx
 8049657:	74 26                	je     804967f <init_timeout+0x34>
 8049659:	c7 44 24 04 bb 9e 04 	movl   $0x8049ebb,0x4(%esp)
 8049660:	08 
 8049661:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 8049668:	e8 8f f1 ff ff       	call   80487fc <signal@plt>
 804966d:	85 db                	test   %ebx,%ebx
 804966f:	b8 00 00 00 00       	mov    $0x0,%eax
 8049674:	0f 48 d8             	cmovs  %eax,%ebx
 8049677:	89 1c 24             	mov    %ebx,(%esp)
 804967a:	e8 5d f2 ff ff       	call   80488dc <alarm@plt>
 804967f:	83 c4 14             	add    $0x14,%esp
 8049682:	5b                   	pop    %ebx
 8049683:	5d                   	pop    %ebp
 8049684:	c3                   	ret    

08049685 <rio_readlineb>:
 8049685:	55                   	push   %ebp
 8049686:	89 e5                	mov    %esp,%ebp
 8049688:	57                   	push   %edi
 8049689:	56                   	push   %esi
 804968a:	53                   	push   %ebx
 804968b:	83 ec 3c             	sub    $0x3c,%esp
 804968e:	89 c3                	mov    %eax,%ebx
 8049690:	89 4d c8             	mov    %ecx,-0x38(%ebp)
 8049693:	89 55 d0             	mov    %edx,-0x30(%ebp)
 8049696:	83 f9 01             	cmp    $0x1,%ecx
 8049699:	0f 86 b4 00 00 00    	jbe    8049753 <rio_readlineb+0xce>
 804969f:	8d 78 0c             	lea    0xc(%eax),%edi
 80496a2:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 80496a5:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
 80496ac:	eb 3c                	jmp    80496ea <rio_readlineb+0x65>
 80496ae:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 80496b5:	00 
 80496b6:	89 7c 24 04          	mov    %edi,0x4(%esp)
 80496ba:	8b 03                	mov    (%ebx),%eax
 80496bc:	89 04 24             	mov    %eax,(%esp)
 80496bf:	e8 b8 f1 ff ff       	call   804887c <read@plt>
 80496c4:	89 43 04             	mov    %eax,0x4(%ebx)
 80496c7:	85 c0                	test   %eax,%eax
 80496c9:	79 11                	jns    80496dc <rio_readlineb+0x57>
 80496cb:	e8 cc f0 ff ff       	call   804879c <__errno_location@plt>
 80496d0:	83 38 04             	cmpl   $0x4,(%eax)
 80496d3:	74 15                	je     80496ea <rio_readlineb+0x65>
 80496d5:	be ff ff ff ff       	mov    $0xffffffff,%esi
 80496da:	eb 51                	jmp    804972d <rio_readlineb+0xa8>
 80496dc:	85 c0                	test   %eax,%eax
 80496de:	0f 84 87 00 00 00    	je     804976b <rio_readlineb+0xe6>
 80496e4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 80496e7:	89 43 08             	mov    %eax,0x8(%ebx)
 80496ea:	8b 73 04             	mov    0x4(%ebx),%esi
 80496ed:	85 f6                	test   %esi,%esi
 80496ef:	7e bd                	jle    80496ae <rio_readlineb+0x29>
 80496f1:	85 f6                	test   %esi,%esi
 80496f3:	75 7d                	jne    8049772 <rio_readlineb+0xed>
 80496f5:	8b 43 08             	mov    0x8(%ebx),%eax
 80496f8:	89 74 24 08          	mov    %esi,0x8(%esp)
 80496fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049700:	8d 55 e7             	lea    -0x19(%ebp),%edx
 8049703:	89 14 24             	mov    %edx,(%esp)
 8049706:	e8 b1 f1 ff ff       	call   80488bc <memcpy@plt>
 804970b:	01 73 08             	add    %esi,0x8(%ebx)
 804970e:	29 73 04             	sub    %esi,0x4(%ebx)
 8049711:	83 fe 01             	cmp    $0x1,%esi
 8049714:	75 17                	jne    804972d <rio_readlineb+0xa8>
 8049716:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 804971a:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804971d:	88 02                	mov    %al,(%edx)
 804971f:	83 c2 01             	add    $0x1,%edx
 8049722:	89 55 d0             	mov    %edx,-0x30(%ebp)
 8049725:	80 7d e7 0a          	cmpb   $0xa,-0x19(%ebp)
 8049729:	75 1a                	jne    8049745 <rio_readlineb+0xc0>
 804972b:	eb 2d                	jmp    804975a <rio_readlineb+0xd5>
 804972d:	8b 55 cc             	mov    -0x34(%ebp),%edx
 8049730:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049735:	85 f6                	test   %esi,%esi
 8049737:	75 2a                	jne    8049763 <rio_readlineb+0xde>
 8049739:	b8 00 00 00 00       	mov    $0x0,%eax
 804973e:	83 fa 01             	cmp    $0x1,%edx
 8049741:	75 17                	jne    804975a <rio_readlineb+0xd5>
 8049743:	eb 1e                	jmp    8049763 <rio_readlineb+0xde>
 8049745:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
 8049749:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804974c:	39 45 c8             	cmp    %eax,-0x38(%ebp)
 804974f:	77 99                	ja     80496ea <rio_readlineb+0x65>
 8049751:	eb 07                	jmp    804975a <rio_readlineb+0xd5>
 8049753:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
 804975a:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804975d:	c6 02 00             	movb   $0x0,(%edx)
 8049760:	8b 45 cc             	mov    -0x34(%ebp),%eax
 8049763:	83 c4 3c             	add    $0x3c,%esp
 8049766:	5b                   	pop    %ebx
 8049767:	5e                   	pop    %esi
 8049768:	5f                   	pop    %edi
 8049769:	5d                   	pop    %ebp
 804976a:	c3                   	ret    
 804976b:	be 00 00 00 00       	mov    $0x0,%esi
 8049770:	eb bb                	jmp    804972d <rio_readlineb+0xa8>
 8049772:	8b 43 08             	mov    0x8(%ebx),%eax
 8049775:	0f b6 00             	movzbl (%eax),%eax
 8049778:	88 45 e7             	mov    %al,-0x19(%ebp)
 804977b:	83 43 08 01          	addl   $0x1,0x8(%ebx)
 804977f:	83 6b 04 01          	subl   $0x1,0x4(%ebx)
 8049783:	eb 91                	jmp    8049716 <rio_readlineb+0x91>

08049785 <submitr>:
 8049785:	55                   	push   %ebp
 8049786:	89 e5                	mov    %esp,%ebp
 8049788:	57                   	push   %edi
 8049789:	56                   	push   %esi
 804978a:	53                   	push   %ebx
 804978b:	81 ec 6c a0 00 00    	sub    $0xa06c,%esp
 8049791:	c7 85 c8 7f ff ff 00 	movl   $0x0,-0x8038(%ebp)
 8049798:	00 00 00 
 804979b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 80497a2:	00 
 80497a3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80497aa:	00 
 80497ab:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80497b2:	e8 d5 f0 ff ff       	call   804888c <socket@plt>
 80497b7:	89 85 b0 5f ff ff    	mov    %eax,-0xa050(%ebp)
 80497bd:	85 c0                	test   %eax,%eax
 80497bf:	79 1b                	jns    80497dc <submitr+0x57>
 80497c1:	b8 f8 a5 04 08       	mov    $0x804a5f8,%eax
 80497c6:	b9 26 00 00 00       	mov    $0x26,%ecx
 80497cb:	8b 7d 20             	mov    0x20(%ebp),%edi
 80497ce:	89 c6                	mov    %eax,%esi
 80497d0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 80497d2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80497d7:	e9 e1 05 00 00       	jmp    8049dbd <submitr+0x638>
 80497dc:	8b 45 08             	mov    0x8(%ebp),%eax
 80497df:	89 04 24             	mov    %eax,(%esp)
 80497e2:	e8 b5 f1 ff ff       	call   804899c <gethostbyname@plt>
 80497e7:	85 c0                	test   %eax,%eax
 80497e9:	75 29                	jne    8049814 <submitr+0x8f>
 80497eb:	b8 20 a6 04 08       	mov    $0x804a620,%eax
 80497f0:	b9 37 00 00 00       	mov    $0x37,%ecx
 80497f5:	8b 7d 20             	mov    0x20(%ebp),%edi
 80497f8:	89 c6                	mov    %eax,%esi
 80497fa:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 80497fc:	8b 85 b0 5f ff ff    	mov    -0xa050(%ebp),%eax
 8049802:	89 04 24             	mov    %eax,(%esp)
 8049805:	e8 22 f1 ff ff       	call   804892c <close@plt>
 804980a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804980f:	e9 a9 05 00 00       	jmp    8049dbd <submitr+0x638>
 8049814:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 8049817:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 804981d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 8049824:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 804982b:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
 8049832:	66 c7 45 d8 02 00    	movw   $0x2,-0x28(%ebp)
 8049838:	8b 50 0c             	mov    0xc(%eax),%edx
 804983b:	89 54 24 08          	mov    %edx,0x8(%esp)
 804983f:	8d 55 dc             	lea    -0x24(%ebp),%edx
 8049842:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049846:	8b 40 10             	mov    0x10(%eax),%eax
 8049849:	8b 00                	mov    (%eax),%eax
 804984b:	89 04 24             	mov    %eax,(%esp)
 804984e:	e8 49 f0 ff ff       	call   804889c <bcopy@plt>
 8049853:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
 8049857:	66 c1 c8 08          	ror    $0x8,%ax
 804985b:	66 89 45 da          	mov    %ax,-0x26(%ebp)
 804985f:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 8049866:	00 
 8049867:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804986b:	8b 8d b0 5f ff ff    	mov    -0xa050(%ebp),%ecx
 8049871:	89 0c 24             	mov    %ecx,(%esp)
 8049874:	e8 53 ef ff ff       	call   80487cc <connect@plt>
 8049879:	85 c0                	test   %eax,%eax
 804987b:	79 29                	jns    80498a6 <submitr+0x121>
 804987d:	b8 58 a6 04 08       	mov    $0x804a658,%eax
 8049882:	b9 2f 00 00 00       	mov    $0x2f,%ecx
 8049887:	8b 7d 20             	mov    0x20(%ebp),%edi
 804988a:	89 c6                	mov    %eax,%esi
 804988c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 804988e:	8b 85 b0 5f ff ff    	mov    -0xa050(%ebp),%eax
 8049894:	89 04 24             	mov    %eax,(%esp)
 8049897:	e8 90 f0 ff ff       	call   804892c <close@plt>
 804989c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80498a1:	e9 17 05 00 00       	jmp    8049dbd <submitr+0x638>
 80498a6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 80498ab:	8b 7d 1c             	mov    0x1c(%ebp),%edi
 80498ae:	b8 00 00 00 00       	mov    $0x0,%eax
 80498b3:	89 d1                	mov    %edx,%ecx
 80498b5:	f2 ae                	repnz scas %es:(%edi),%al
 80498b7:	89 cb                	mov    %ecx,%ebx
 80498b9:	f7 d3                	not    %ebx
 80498bb:	8b 7d 10             	mov    0x10(%ebp),%edi
 80498be:	89 d1                	mov    %edx,%ecx
 80498c0:	f2 ae                	repnz scas %es:(%edi),%al
 80498c2:	89 8d b4 5f ff ff    	mov    %ecx,-0xa04c(%ebp)
 80498c8:	8b 7d 14             	mov    0x14(%ebp),%edi
 80498cb:	89 d1                	mov    %edx,%ecx
 80498cd:	f2 ae                	repnz scas %es:(%edi),%al
 80498cf:	89 ce                	mov    %ecx,%esi
 80498d1:	f7 d6                	not    %esi
 80498d3:	8b 7d 18             	mov    0x18(%ebp),%edi
 80498d6:	89 d1                	mov    %edx,%ecx
 80498d8:	f2 ae                	repnz scas %es:(%edi),%al
 80498da:	2b b5 b4 5f ff ff    	sub    -0xa04c(%ebp),%esi
 80498e0:	29 ce                	sub    %ecx,%esi
 80498e2:	8d 44 5b fd          	lea    -0x3(%ebx,%ebx,2),%eax
 80498e6:	8d 44 06 7b          	lea    0x7b(%esi,%eax,1),%eax
 80498ea:	3d 00 20 00 00       	cmp    $0x2000,%eax
 80498ef:	76 7c                	jbe    804996d <submitr+0x1e8>
 80498f1:	8b 75 20             	mov    0x20(%ebp),%esi
 80498f4:	c7 06 45 72 72 6f    	movl   $0x6f727245,(%esi)
 80498fa:	c7 46 04 72 3a 20 52 	movl   $0x52203a72,0x4(%esi)
 8049901:	c7 46 08 65 73 75 6c 	movl   $0x6c757365,0x8(%esi)
 8049908:	c7 46 0c 74 20 73 74 	movl   $0x74732074,0xc(%esi)
 804990f:	c7 46 10 72 69 6e 67 	movl   $0x676e6972,0x10(%esi)
 8049916:	c7 46 14 20 74 6f 6f 	movl   $0x6f6f7420,0x14(%esi)
 804991d:	c7 46 18 20 6c 61 72 	movl   $0x72616c20,0x18(%esi)
 8049924:	c7 46 1c 67 65 2e 20 	movl   $0x202e6567,0x1c(%esi)
 804992b:	c7 46 20 49 6e 63 72 	movl   $0x72636e49,0x20(%esi)
 8049932:	c7 46 24 65 61 73 65 	movl   $0x65736165,0x24(%esi)
 8049939:	c7 46 28 20 53 55 42 	movl   $0x42555320,0x28(%esi)
 8049940:	c7 46 2c 4d 49 54 52 	movl   $0x5254494d,0x2c(%esi)
 8049947:	c7 46 30 5f 4d 41 58 	movl   $0x58414d5f,0x30(%esi)
 804994e:	c7 46 34 42 55 46 00 	movl   $0x465542,0x34(%esi)
 8049955:	8b bd b0 5f ff ff    	mov    -0xa050(%ebp),%edi
 804995b:	89 3c 24             	mov    %edi,(%esp)
 804995e:	e8 c9 ef ff ff       	call   804892c <close@plt>
 8049963:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049968:	e9 50 04 00 00       	jmp    8049dbd <submitr+0x638>
 804996d:	8d 95 cc 9f ff ff    	lea    -0x6034(%ebp),%edx
 8049973:	b9 00 08 00 00       	mov    $0x800,%ecx
 8049978:	b8 00 00 00 00       	mov    $0x0,%eax
 804997d:	89 d7                	mov    %edx,%edi
 804997f:	f3 ab                	rep stos %eax,%es:(%edi)
 8049981:	8b 7d 1c             	mov    0x1c(%ebp),%edi
 8049984:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 8049989:	f2 ae                	repnz scas %es:(%edi),%al
 804998b:	f7 d1                	not    %ecx
 804998d:	89 cf                	mov    %ecx,%edi
 804998f:	83 ef 01             	sub    $0x1,%edi
 8049992:	0f 84 30 04 00 00    	je     8049dc8 <submitr+0x643>
 8049998:	89 d6                	mov    %edx,%esi
 804999a:	bb 00 00 00 00       	mov    $0x0,%ebx
 804999f:	89 bd b4 5f ff ff    	mov    %edi,-0xa04c(%ebp)
 80499a5:	8b 7d 1c             	mov    0x1c(%ebp),%edi
 80499a8:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
 80499ac:	3c 2a                	cmp    $0x2a,%al
 80499ae:	74 24                	je     80499d4 <submitr+0x24f>
 80499b0:	3c 2d                	cmp    $0x2d,%al
 80499b2:	74 20                	je     80499d4 <submitr+0x24f>
 80499b4:	3c 2e                	cmp    $0x2e,%al
 80499b6:	74 1c                	je     80499d4 <submitr+0x24f>
 80499b8:	3c 5f                	cmp    $0x5f,%al
 80499ba:	74 18                	je     80499d4 <submitr+0x24f>
 80499bc:	8d 50 d0             	lea    -0x30(%eax),%edx
 80499bf:	80 fa 09             	cmp    $0x9,%dl
 80499c2:	76 10                	jbe    80499d4 <submitr+0x24f>
 80499c4:	8d 50 bf             	lea    -0x41(%eax),%edx
 80499c7:	80 fa 19             	cmp    $0x19,%dl
 80499ca:	76 08                	jbe    80499d4 <submitr+0x24f>
 80499cc:	8d 50 9f             	lea    -0x61(%eax),%edx
 80499cf:	80 fa 19             	cmp    $0x19,%dl
 80499d2:	77 07                	ja     80499db <submitr+0x256>
 80499d4:	88 06                	mov    %al,(%esi)
 80499d6:	83 c6 01             	add    $0x1,%esi
 80499d9:	eb 55                	jmp    8049a30 <submitr+0x2ab>
 80499db:	3c 20                	cmp    $0x20,%al
 80499dd:	75 08                	jne    80499e7 <submitr+0x262>
 80499df:	c6 06 2b             	movb   $0x2b,(%esi)
 80499e2:	83 c6 01             	add    $0x1,%esi
 80499e5:	eb 49                	jmp    8049a30 <submitr+0x2ab>
 80499e7:	8d 50 e0             	lea    -0x20(%eax),%edx
 80499ea:	80 fa 5f             	cmp    $0x5f,%dl
 80499ed:	76 04                	jbe    80499f3 <submitr+0x26e>
 80499ef:	3c 09                	cmp    $0x9,%al
 80499f1:	75 51                	jne    8049a44 <submitr+0x2bf>
 80499f3:	0f b6 c0             	movzbl %al,%eax
 80499f6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80499fa:	c7 44 24 04 ad a5 04 	movl   $0x804a5ad,0x4(%esp)
 8049a01:	08 
 8049a02:	8d 85 c0 5f ff ff    	lea    -0xa040(%ebp),%eax
 8049a08:	89 04 24             	mov    %eax,(%esp)
 8049a0b:	e8 9c ed ff ff       	call   80487ac <sprintf@plt>
 8049a10:	0f b6 85 c0 5f ff ff 	movzbl -0xa040(%ebp),%eax
 8049a17:	88 06                	mov    %al,(%esi)
 8049a19:	0f b6 85 c1 5f ff ff 	movzbl -0xa03f(%ebp),%eax
 8049a20:	88 46 01             	mov    %al,0x1(%esi)
 8049a23:	0f b6 85 c2 5f ff ff 	movzbl -0xa03e(%ebp),%eax
 8049a2a:	88 46 02             	mov    %al,0x2(%esi)
 8049a2d:	83 c6 03             	add    $0x3,%esi
 8049a30:	83 c3 01             	add    $0x1,%ebx
 8049a33:	3b 9d b4 5f ff ff    	cmp    -0xa04c(%ebp),%ebx
 8049a39:	0f 85 69 ff ff ff    	jne    80499a8 <submitr+0x223>
 8049a3f:	e9 84 03 00 00       	jmp    8049dc8 <submitr+0x643>
 8049a44:	b8 88 a6 04 08       	mov    $0x804a688,%eax
 8049a49:	b9 43 00 00 00       	mov    $0x43,%ecx
 8049a4e:	8b 7d 20             	mov    0x20(%ebp),%edi
 8049a51:	89 c6                	mov    %eax,%esi
 8049a53:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 8049a55:	8b 85 b0 5f ff ff    	mov    -0xa050(%ebp),%eax
 8049a5b:	89 04 24             	mov    %eax,(%esp)
 8049a5e:	e8 c9 ee ff ff       	call   804892c <close@plt>
 8049a63:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049a68:	e9 50 03 00 00       	jmp    8049dbd <submitr+0x638>
 8049a6d:	01 c6                	add    %eax,%esi
 8049a6f:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049a73:	89 74 24 04          	mov    %esi,0x4(%esp)
 8049a77:	89 3c 24             	mov    %edi,(%esp)
 8049a7a:	e8 bd ed ff ff       	call   804883c <write@plt>
 8049a7f:	85 c0                	test   %eax,%eax
 8049a81:	7f 0f                	jg     8049a92 <submitr+0x30d>
 8049a83:	e8 14 ed ff ff       	call   804879c <__errno_location@plt>
 8049a88:	83 38 04             	cmpl   $0x4,(%eax)
 8049a8b:	75 13                	jne    8049aa0 <submitr+0x31b>
 8049a8d:	b8 00 00 00 00       	mov    $0x0,%eax
 8049a92:	29 c3                	sub    %eax,%ebx
 8049a94:	75 d7                	jne    8049a6d <submitr+0x2e8>
 8049a96:	8b bd b4 5f ff ff    	mov    -0xa04c(%ebp),%edi
 8049a9c:	85 ff                	test   %edi,%edi
 8049a9e:	79 64                	jns    8049b04 <submitr+0x37f>
 8049aa0:	8b 7d 20             	mov    0x20(%ebp),%edi
 8049aa3:	be cc a6 04 08       	mov    $0x804a6cc,%esi
 8049aa8:	b8 34 00 00 00       	mov    $0x34,%eax
 8049aad:	f7 c7 01 00 00 00    	test   $0x1,%edi
 8049ab3:	74 04                	je     8049ab9 <submitr+0x334>
 8049ab5:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 8049ab6:	83 e8 01             	sub    $0x1,%eax
 8049ab9:	f7 c7 02 00 00 00    	test   $0x2,%edi
 8049abf:	74 05                	je     8049ac6 <submitr+0x341>
 8049ac1:	66 a5                	movsw  %ds:(%esi),%es:(%edi)
 8049ac3:	83 e8 02             	sub    $0x2,%eax
 8049ac6:	89 c1                	mov    %eax,%ecx
 8049ac8:	c1 e9 02             	shr    $0x2,%ecx
 8049acb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 8049acd:	ba 00 00 00 00       	mov    $0x0,%edx
 8049ad2:	a8 02                	test   $0x2,%al
 8049ad4:	74 0b                	je     8049ae1 <submitr+0x35c>
 8049ad6:	0f b7 0c 16          	movzwl (%esi,%edx,1),%ecx
 8049ada:	66 89 0c 17          	mov    %cx,(%edi,%edx,1)
 8049ade:	83 c2 02             	add    $0x2,%edx
 8049ae1:	a8 01                	test   $0x1,%al
 8049ae3:	74 07                	je     8049aec <submitr+0x367>
 8049ae5:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 8049ae9:	88 04 17             	mov    %al,(%edi,%edx,1)
 8049aec:	8b 8d b0 5f ff ff    	mov    -0xa050(%ebp),%ecx
 8049af2:	89 0c 24             	mov    %ecx,(%esp)
 8049af5:	e8 32 ee ff ff       	call   804892c <close@plt>
 8049afa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049aff:	e9 b9 02 00 00       	jmp    8049dbd <submitr+0x638>
 8049b04:	8b b5 b0 5f ff ff    	mov    -0xa050(%ebp),%esi
 8049b0a:	89 b5 cc df ff ff    	mov    %esi,-0x2034(%ebp)
 8049b10:	c7 85 d0 df ff ff 00 	movl   $0x0,-0x2030(%ebp)
 8049b17:	00 00 00 
 8049b1a:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
 8049b20:	8d 95 d8 df ff ff    	lea    -0x2028(%ebp),%edx
 8049b26:	89 95 d4 df ff ff    	mov    %edx,-0x202c(%ebp)
 8049b2c:	8d 95 cc bf ff ff    	lea    -0x4034(%ebp),%edx
 8049b32:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049b37:	e8 49 fb ff ff       	call   8049685 <rio_readlineb>
 8049b3c:	85 c0                	test   %eax,%eax
 8049b3e:	7f 29                	jg     8049b69 <submitr+0x3e4>
 8049b40:	b8 00 a7 04 08       	mov    $0x804a700,%eax
 8049b45:	b9 3e 00 00 00       	mov    $0x3e,%ecx
 8049b4a:	8b 7d 20             	mov    0x20(%ebp),%edi
 8049b4d:	89 c6                	mov    %eax,%esi
 8049b4f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 8049b51:	8b 85 b0 5f ff ff    	mov    -0xa050(%ebp),%eax
 8049b57:	89 04 24             	mov    %eax,(%esp)
 8049b5a:	e8 cd ed ff ff       	call   804892c <close@plt>
 8049b5f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049b64:	e9 54 02 00 00       	jmp    8049dbd <submitr+0x638>
 8049b69:	8d bd cc bf ff ff    	lea    -0x4034(%ebp),%edi
 8049b6f:	8d 85 c8 5f ff ff    	lea    -0xa038(%ebp),%eax
 8049b75:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049b79:	8d 85 c8 7f ff ff    	lea    -0x8038(%ebp),%eax
 8049b7f:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049b83:	8d 85 cc 7f ff ff    	lea    -0x8034(%ebp),%eax
 8049b89:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049b8d:	c7 44 24 04 b4 a5 04 	movl   $0x804a5b4,0x4(%esp)
 8049b94:	08 
 8049b95:	89 3c 24             	mov    %edi,(%esp)
 8049b98:	e8 7f ec ff ff       	call   804881c <__isoc99_sscanf@plt>
 8049b9d:	8b 85 c8 7f ff ff    	mov    -0x8038(%ebp),%eax
 8049ba3:	8d 9d cc bf ff ff    	lea    -0x4034(%ebp),%ebx
 8049ba9:	8d b5 cc df ff ff    	lea    -0x2034(%ebp),%esi
 8049baf:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8049bb4:	0f 84 cf 00 00 00    	je     8049c89 <submitr+0x504>
 8049bba:	8d 95 c8 5f ff ff    	lea    -0xa038(%ebp),%edx
 8049bc0:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049bc4:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049bc8:	c7 44 24 04 40 a7 04 	movl   $0x804a740,0x4(%esp)
 8049bcf:	08 
 8049bd0:	8b 4d 20             	mov    0x20(%ebp),%ecx
 8049bd3:	89 0c 24             	mov    %ecx,(%esp)
 8049bd6:	e8 d1 eb ff ff       	call   80487ac <sprintf@plt>
 8049bdb:	8b b5 b0 5f ff ff    	mov    -0xa050(%ebp),%esi
 8049be1:	89 34 24             	mov    %esi,(%esp)
 8049be4:	e8 43 ed ff ff       	call   804892c <close@plt>
 8049be9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049bee:	e9 ca 01 00 00       	jmp    8049dbd <submitr+0x638>
 8049bf3:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049bf8:	89 da                	mov    %ebx,%edx
 8049bfa:	89 f0                	mov    %esi,%eax
 8049bfc:	e8 84 fa ff ff       	call   8049685 <rio_readlineb>
 8049c01:	85 c0                	test   %eax,%eax
 8049c03:	0f 8f 80 00 00 00    	jg     8049c89 <submitr+0x504>
 8049c09:	8b 7d 20             	mov    0x20(%ebp),%edi
 8049c0c:	c7 07 45 72 72 6f    	movl   $0x6f727245,(%edi)
 8049c12:	c7 47 04 72 3a 20 43 	movl   $0x43203a72,0x4(%edi)
 8049c19:	c7 47 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%edi)
 8049c20:	c7 47 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%edi)
 8049c27:	c7 47 10 61 62 6c 65 	movl   $0x656c6261,0x10(%edi)
 8049c2e:	c7 47 14 20 74 6f 20 	movl   $0x206f7420,0x14(%edi)
 8049c35:	c7 47 18 72 65 61 64 	movl   $0x64616572,0x18(%edi)
 8049c3c:	c7 47 1c 20 68 65 61 	movl   $0x61656820,0x1c(%edi)
 8049c43:	c7 47 20 64 65 72 73 	movl   $0x73726564,0x20(%edi)
 8049c4a:	c7 47 24 20 66 72 6f 	movl   $0x6f726620,0x24(%edi)
 8049c51:	c7 47 28 6d 20 41 75 	movl   $0x7541206d,0x28(%edi)
 8049c58:	c7 47 2c 74 6f 6c 61 	movl   $0x616c6f74,0x2c(%edi)
 8049c5f:	c7 47 30 62 20 73 65 	movl   $0x65732062,0x30(%edi)
 8049c66:	c7 47 34 72 76 65 72 	movl   $0x72657672,0x34(%edi)
 8049c6d:	c6 47 38 00          	movb   $0x0,0x38(%edi)
 8049c71:	8b 85 b0 5f ff ff    	mov    -0xa050(%ebp),%eax
 8049c77:	89 04 24             	mov    %eax,(%esp)
 8049c7a:	e8 ad ec ff ff       	call   804892c <close@plt>
 8049c7f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049c84:	e9 34 01 00 00       	jmp    8049dbd <submitr+0x638>
 8049c89:	b8 cb a5 04 08       	mov    $0x804a5cb,%eax
 8049c8e:	0f b6 13             	movzbl (%ebx),%edx
 8049c91:	3a 10                	cmp    (%eax),%dl
 8049c93:	0f 85 5a ff ff ff    	jne    8049bf3 <submitr+0x46e>
 8049c99:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 8049c9d:	3a 50 01             	cmp    0x1(%eax),%dl
 8049ca0:	0f 85 4d ff ff ff    	jne    8049bf3 <submitr+0x46e>
 8049ca6:	0f b6 53 02          	movzbl 0x2(%ebx),%edx
 8049caa:	3a 50 02             	cmp    0x2(%eax),%dl
 8049cad:	0f 85 40 ff ff ff    	jne    8049bf3 <submitr+0x46e>
 8049cb3:	8d 95 cc bf ff ff    	lea    -0x4034(%ebp),%edx
 8049cb9:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
 8049cbf:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049cc4:	e8 bc f9 ff ff       	call   8049685 <rio_readlineb>
 8049cc9:	85 c0                	test   %eax,%eax
 8049ccb:	7f 64                	jg     8049d31 <submitr+0x5ac>
 8049ccd:	8b 7d 20             	mov    0x20(%ebp),%edi
 8049cd0:	be 70 a7 04 08       	mov    $0x804a770,%esi
 8049cd5:	b8 40 00 00 00       	mov    $0x40,%eax
 8049cda:	f7 c7 01 00 00 00    	test   $0x1,%edi
 8049ce0:	74 04                	je     8049ce6 <submitr+0x561>
 8049ce2:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 8049ce3:	83 e8 01             	sub    $0x1,%eax
 8049ce6:	f7 c7 02 00 00 00    	test   $0x2,%edi
 8049cec:	74 05                	je     8049cf3 <submitr+0x56e>
 8049cee:	66 a5                	movsw  %ds:(%esi),%es:(%edi)
 8049cf0:	83 e8 02             	sub    $0x2,%eax
 8049cf3:	89 c1                	mov    %eax,%ecx
 8049cf5:	c1 e9 02             	shr    $0x2,%ecx
 8049cf8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 8049cfa:	ba 00 00 00 00       	mov    $0x0,%edx
 8049cff:	a8 02                	test   $0x2,%al
 8049d01:	74 0b                	je     8049d0e <submitr+0x589>
 8049d03:	0f b7 0c 16          	movzwl (%esi,%edx,1),%ecx
 8049d07:	66 89 0c 17          	mov    %cx,(%edi,%edx,1)
 8049d0b:	83 c2 02             	add    $0x2,%edx
 8049d0e:	a8 01                	test   $0x1,%al
 8049d10:	74 07                	je     8049d19 <submitr+0x594>
 8049d12:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 8049d16:	88 04 17             	mov    %al,(%edi,%edx,1)
 8049d19:	8b 8d b0 5f ff ff    	mov    -0xa050(%ebp),%ecx
 8049d1f:	89 0c 24             	mov    %ecx,(%esp)
 8049d22:	e8 05 ec ff ff       	call   804892c <close@plt>
 8049d27:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049d2c:	e9 8c 00 00 00       	jmp    8049dbd <submitr+0x638>
 8049d31:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049d35:	8b 75 20             	mov    0x20(%ebp),%esi
 8049d38:	89 34 24             	mov    %esi,(%esp)
 8049d3b:	e8 ac eb ff ff       	call   80488ec <strcpy@plt>
 8049d40:	8b bd b0 5f ff ff    	mov    -0xa050(%ebp),%edi
 8049d46:	89 3c 24             	mov    %edi,(%esp)
 8049d49:	e8 de eb ff ff       	call   804892c <close@plt>
 8049d4e:	89 f0                	mov    %esi,%eax
 8049d50:	0f b6 16             	movzbl (%esi),%edx
 8049d53:	b9 c5 a5 04 08       	mov    $0x804a5c5,%ecx
 8049d58:	0f b6 19             	movzbl (%ecx),%ebx
 8049d5b:	39 da                	cmp    %ebx,%edx
 8049d5d:	75 1b                	jne    8049d7a <submitr+0x5f5>
 8049d5f:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
 8049d63:	3a 59 01             	cmp    0x1(%ecx),%bl
 8049d66:	75 12                	jne    8049d7a <submitr+0x5f5>
 8049d68:	0f b6 5e 02          	movzbl 0x2(%esi),%ebx
 8049d6c:	3a 59 02             	cmp    0x2(%ecx),%bl
 8049d6f:	75 09                	jne    8049d7a <submitr+0x5f5>
 8049d71:	0f b6 5e 03          	movzbl 0x3(%esi),%ebx
 8049d75:	3a 59 03             	cmp    0x3(%ecx),%bl
 8049d78:	74 37                	je     8049db1 <submitr+0x62c>
 8049d7a:	8b 75 20             	mov    0x20(%ebp),%esi
 8049d7d:	bf c9 a5 04 08       	mov    $0x804a5c9,%edi
 8049d82:	b9 05 00 00 00       	mov    $0x5,%ecx
 8049d87:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
 8049d89:	0f 97 c3             	seta   %bl
 8049d8c:	0f 92 c1             	setb   %cl
 8049d8f:	38 cb                	cmp    %cl,%bl
 8049d91:	74 1e                	je     8049db1 <submitr+0x62c>
 8049d93:	b9 ce a5 04 08       	mov    $0x804a5ce,%ecx
 8049d98:	0f b6 19             	movzbl (%ecx),%ebx
 8049d9b:	39 da                	cmp    %ebx,%edx
 8049d9d:	75 19                	jne    8049db8 <submitr+0x633>
 8049d9f:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 8049da3:	3a 51 01             	cmp    0x1(%ecx),%dl
 8049da6:	75 10                	jne    8049db8 <submitr+0x633>
 8049da8:	0f b6 40 02          	movzbl 0x2(%eax),%eax
 8049dac:	3a 41 02             	cmp    0x2(%ecx),%al
 8049daf:	75 07                	jne    8049db8 <submitr+0x633>
 8049db1:	b8 00 00 00 00       	mov    $0x0,%eax
 8049db6:	eb 05                	jmp    8049dbd <submitr+0x638>
 8049db8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049dbd:	81 c4 6c a0 00 00    	add    $0xa06c,%esp
 8049dc3:	5b                   	pop    %ebx
 8049dc4:	5e                   	pop    %esi
 8049dc5:	5f                   	pop    %edi
 8049dc6:	5d                   	pop    %ebp
 8049dc7:	c3                   	ret    
 8049dc8:	8b 45 08             	mov    0x8(%ebp),%eax
 8049dcb:	89 44 24 18          	mov    %eax,0x18(%esp)
 8049dcf:	8d 85 cc 9f ff ff    	lea    -0x6034(%ebp),%eax
 8049dd5:	89 44 24 14          	mov    %eax,0x14(%esp)
 8049dd9:	8b 4d 18             	mov    0x18(%ebp),%ecx
 8049ddc:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8049de0:	8b 75 14             	mov    0x14(%ebp),%esi
 8049de3:	89 74 24 0c          	mov    %esi,0xc(%esp)
 8049de7:	8b 7d 10             	mov    0x10(%ebp),%edi
 8049dea:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8049dee:	c7 44 24 04 b0 a7 04 	movl   $0x804a7b0,0x4(%esp)
 8049df5:	08 
 8049df6:	8d bd cc bf ff ff    	lea    -0x4034(%ebp),%edi
 8049dfc:	89 3c 24             	mov    %edi,(%esp)
 8049dff:	e8 a8 e9 ff ff       	call   80487ac <sprintf@plt>
 8049e04:	b8 00 00 00 00       	mov    $0x0,%eax
 8049e09:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 8049e0e:	f2 ae                	repnz scas %es:(%edi),%al
 8049e10:	f7 d1                	not    %ecx
 8049e12:	89 cf                	mov    %ecx,%edi
 8049e14:	83 ef 01             	sub    $0x1,%edi
 8049e17:	0f 84 e7 fc ff ff    	je     8049b04 <submitr+0x37f>
 8049e1d:	89 fb                	mov    %edi,%ebx
 8049e1f:	8d b5 cc bf ff ff    	lea    -0x4034(%ebp),%esi
 8049e25:	89 bd b4 5f ff ff    	mov    %edi,-0xa04c(%ebp)
 8049e2b:	8b bd b0 5f ff ff    	mov    -0xa050(%ebp),%edi
 8049e31:	e9 39 fc ff ff       	jmp    8049a6f <submitr+0x2ea>

08049e36 <driver_post>:
 8049e36:	55                   	push   %ebp
 8049e37:	89 e5                	mov    %esp,%ebp
 8049e39:	53                   	push   %ebx
 8049e3a:	83 ec 24             	sub    $0x24,%esp
 8049e3d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e40:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049e43:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8049e46:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049e4a:	74 20                	je     8049e6c <driver_post+0x36>
 8049e4c:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049e50:	c7 04 24 d1 a5 04 08 	movl   $0x804a5d1,(%esp)
 8049e57:	e8 a0 ea ff ff       	call   80488fc <printf@plt>
 8049e5c:	66 c7 03 4f 4b       	movw   $0x4b4f,(%ebx)
 8049e61:	c6 43 02 00          	movb   $0x0,0x2(%ebx)
 8049e65:	b8 00 00 00 00       	mov    $0x0,%eax
 8049e6a:	eb 49                	jmp    8049eb5 <driver_post+0x7f>
 8049e6c:	85 c0                	test   %eax,%eax
 8049e6e:	74 37                	je     8049ea7 <driver_post+0x71>
 8049e70:	80 38 00             	cmpb   $0x0,(%eax)
 8049e73:	74 32                	je     8049ea7 <driver_post+0x71>
 8049e75:	89 5c 24 18          	mov    %ebx,0x18(%esp)
 8049e79:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049e7d:	c7 44 24 10 e8 a5 04 	movl   $0x804a5e8,0x10(%esp)
 8049e84:	08 
 8049e85:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049e89:	c7 44 24 08 ef a5 04 	movl   $0x804a5ef,0x8(%esp)
 8049e90:	08 
 8049e91:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
 8049e98:	00 
 8049e99:	c7 04 24 9e a5 04 08 	movl   $0x804a59e,(%esp)
 8049ea0:	e8 e0 f8 ff ff       	call   8049785 <submitr>
 8049ea5:	eb 0e                	jmp    8049eb5 <driver_post+0x7f>
 8049ea7:	66 c7 03 4f 4b       	movw   $0x4b4f,(%ebx)
 8049eac:	c6 43 02 00          	movb   $0x0,0x2(%ebx)
 8049eb0:	b8 00 00 00 00       	mov    $0x0,%eax
 8049eb5:	83 c4 24             	add    $0x24,%esp
 8049eb8:	5b                   	pop    %ebx
 8049eb9:	5d                   	pop    %ebp
 8049eba:	c3                   	ret    

08049ebb <sigalrm_handler>:
 8049ebb:	55                   	push   %ebp
 8049ebc:	89 e5                	mov    %esp,%ebp
 8049ebe:	83 ec 18             	sub    $0x18,%esp
 8049ec1:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8049ec8:	00 
 8049ec9:	c7 44 24 04 0c a8 04 	movl   $0x804a80c,0x4(%esp)
 8049ed0:	08 
 8049ed1:	a1 00 b3 04 08       	mov    0x804b300,%eax
 8049ed6:	89 04 24             	mov    %eax,(%esp)
 8049ed9:	e8 6e ea ff ff       	call   804894c <fprintf@plt>
 8049ede:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049ee5:	e8 d2 ea ff ff       	call   80489bc <exit@plt>
 8049eea:	90                   	nop
 8049eeb:	90                   	nop

08049eec <hash>:
 8049eec:	55                   	push   %ebp
 8049eed:	89 e5                	mov    %esp,%ebp
 8049eef:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049ef2:	0f b6 11             	movzbl (%ecx),%edx
 8049ef5:	b8 00 00 00 00       	mov    $0x0,%eax
 8049efa:	84 d2                	test   %dl,%dl
 8049efc:	74 13                	je     8049f11 <hash+0x25>
 8049efe:	6b c0 67             	imul   $0x67,%eax,%eax
 8049f01:	0f be d2             	movsbl %dl,%edx
 8049f04:	8d 04 02             	lea    (%edx,%eax,1),%eax
 8049f07:	83 c1 01             	add    $0x1,%ecx
 8049f0a:	0f b6 11             	movzbl (%ecx),%edx
 8049f0d:	84 d2                	test   %dl,%dl
 8049f0f:	75 ed                	jne    8049efe <hash+0x12>
 8049f11:	5d                   	pop    %ebp
 8049f12:	c3                   	ret    

08049f13 <check>:
 8049f13:	55                   	push   %ebp
 8049f14:	89 e5                	mov    %esp,%ebp
 8049f16:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f19:	89 c2                	mov    %eax,%edx
 8049f1b:	c1 ea 1c             	shr    $0x1c,%edx
 8049f1e:	85 d2                	test   %edx,%edx
 8049f20:	74 24                	je     8049f46 <check+0x33>
 8049f22:	3c 0a                	cmp    $0xa,%al
 8049f24:	74 20                	je     8049f46 <check+0x33>
 8049f26:	0f b6 d4             	movzbl %ah,%edx
 8049f29:	83 fa 0a             	cmp    $0xa,%edx
 8049f2c:	74 18                	je     8049f46 <check+0x33>
 8049f2e:	89 c2                	mov    %eax,%edx
 8049f30:	c1 ea 10             	shr    $0x10,%edx
 8049f33:	80 fa 0a             	cmp    $0xa,%dl
 8049f36:	74 0e                	je     8049f46 <check+0x33>
 8049f38:	c1 e8 18             	shr    $0x18,%eax
 8049f3b:	83 f8 0a             	cmp    $0xa,%eax
 8049f3e:	0f 95 c0             	setne  %al
 8049f41:	0f b6 c0             	movzbl %al,%eax
 8049f44:	eb 05                	jmp    8049f4b <check+0x38>
 8049f46:	b8 00 00 00 00       	mov    $0x0,%eax
 8049f4b:	5d                   	pop    %ebp
 8049f4c:	c3                   	ret    

08049f4d <gencookie>:
 8049f4d:	55                   	push   %ebp
 8049f4e:	89 e5                	mov    %esp,%ebp
 8049f50:	53                   	push   %ebx
 8049f51:	83 ec 14             	sub    $0x14,%esp
 8049f54:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f57:	89 04 24             	mov    %eax,(%esp)
 8049f5a:	e8 8d ff ff ff       	call   8049eec <hash>
 8049f5f:	89 04 24             	mov    %eax,(%esp)
 8049f62:	e8 55 e8 ff ff       	call   80487bc <srand@plt>
 8049f67:	e8 10 ea ff ff       	call   804897c <rand@plt>
 8049f6c:	89 c3                	mov    %eax,%ebx
 8049f6e:	89 04 24             	mov    %eax,(%esp)
 8049f71:	e8 9d ff ff ff       	call   8049f13 <check>
 8049f76:	85 c0                	test   %eax,%eax
 8049f78:	74 ed                	je     8049f67 <gencookie+0x1a>
 8049f7a:	89 d8                	mov    %ebx,%eax
 8049f7c:	83 c4 14             	add    $0x14,%esp
 8049f7f:	5b                   	pop    %ebx
 8049f80:	5d                   	pop    %ebp
 8049f81:	c3                   	ret    
 8049f82:	90                   	nop
 8049f83:	90                   	nop
 8049f84:	90                   	nop
 8049f85:	90                   	nop
 8049f86:	90                   	nop
 8049f87:	90                   	nop
 8049f88:	90                   	nop
 8049f89:	90                   	nop
 8049f8a:	90                   	nop
 8049f8b:	90                   	nop
 8049f8c:	90                   	nop
 8049f8d:	90                   	nop
 8049f8e:	90                   	nop
 8049f8f:	90                   	nop

08049f90 <__libc_csu_fini>:
 8049f90:	55                   	push   %ebp
 8049f91:	89 e5                	mov    %esp,%ebp
 8049f93:	5d                   	pop    %ebp
 8049f94:	c3                   	ret    
 8049f95:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%eax,%eax,1)
 8049f9c:	00 00 00 00 

08049fa0 <__libc_csu_init>:
 8049fa0:	55                   	push   %ebp
 8049fa1:	89 e5                	mov    %esp,%ebp
 8049fa3:	57                   	push   %edi
 8049fa4:	56                   	push   %esi
 8049fa5:	53                   	push   %ebx
 8049fa6:	e8 4f 00 00 00       	call   8049ffa <__i686.get_pc_thunk.bx>
 8049fab:	81 c3 35 11 00 00    	add    $0x1135,%ebx
 8049fb1:	83 ec 1c             	sub    $0x1c,%esp
 8049fb4:	e8 a3 e7 ff ff       	call   804875c <_init>
 8049fb9:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 8049fbf:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8049fc5:	29 c7                	sub    %eax,%edi
 8049fc7:	c1 ff 02             	sar    $0x2,%edi
 8049fca:	85 ff                	test   %edi,%edi
 8049fcc:	74 24                	je     8049ff2 <__libc_csu_init+0x52>
 8049fce:	31 f6                	xor    %esi,%esi
 8049fd0:	8b 45 10             	mov    0x10(%ebp),%eax
 8049fd3:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049fd7:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049fda:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049fde:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fe1:	89 04 24             	mov    %eax,(%esp)
 8049fe4:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 8049feb:	83 c6 01             	add    $0x1,%esi
 8049fee:	39 fe                	cmp    %edi,%esi
 8049ff0:	72 de                	jb     8049fd0 <__libc_csu_init+0x30>
 8049ff2:	83 c4 1c             	add    $0x1c,%esp
 8049ff5:	5b                   	pop    %ebx
 8049ff6:	5e                   	pop    %esi
 8049ff7:	5f                   	pop    %edi
 8049ff8:	5d                   	pop    %ebp
 8049ff9:	c3                   	ret    

08049ffa <__i686.get_pc_thunk.bx>:
 8049ffa:	8b 1c 24             	mov    (%esp),%ebx
 8049ffd:	c3                   	ret    
 8049ffe:	90                   	nop
 8049fff:	90                   	nop

0804a000 <__do_global_ctors_aux>:
 804a000:	55                   	push   %ebp
 804a001:	89 e5                	mov    %esp,%ebp
 804a003:	53                   	push   %ebx
 804a004:	83 ec 04             	sub    $0x4,%esp
 804a007:	a1 00 b0 04 08       	mov    0x804b000,%eax
 804a00c:	83 f8 ff             	cmp    $0xffffffff,%eax
 804a00f:	74 13                	je     804a024 <__do_global_ctors_aux+0x24>
 804a011:	bb 00 b0 04 08       	mov    $0x804b000,%ebx
 804a016:	66 90                	xchg   %ax,%ax
 804a018:	83 eb 04             	sub    $0x4,%ebx
 804a01b:	ff d0                	call   *%eax
 804a01d:	8b 03                	mov    (%ebx),%eax
 804a01f:	83 f8 ff             	cmp    $0xffffffff,%eax
 804a022:	75 f4                	jne    804a018 <__do_global_ctors_aux+0x18>
 804a024:	83 c4 04             	add    $0x4,%esp
 804a027:	5b                   	pop    %ebx
 804a028:	5d                   	pop    %ebp
 804a029:	c3                   	ret    
 804a02a:	90                   	nop
 804a02b:	90                   	nop

Disassembly of section .fini:

0804a02c <_fini>:
 804a02c:	55                   	push   %ebp
 804a02d:	89 e5                	mov    %esp,%ebp
 804a02f:	53                   	push   %ebx
 804a030:	83 ec 04             	sub    $0x4,%esp
 804a033:	e8 00 00 00 00       	call   804a038 <_fini+0xc>
 804a038:	5b                   	pop    %ebx
 804a039:	81 c3 a8 10 00 00    	add    $0x10a8,%ebx
 804a03f:	e8 bc e9 ff ff       	call   8048a00 <__do_global_dtors_aux>
 804a044:	59                   	pop    %ecx
 804a045:	5b                   	pop    %ebx
 804a046:	c9                   	leave  
 804a047:	c3                   	ret    
