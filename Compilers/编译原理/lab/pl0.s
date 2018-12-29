# Begin asmlist al_procedures

.text
	.align 3
.globl	_P$PL0_$$_ERROR$SMALLINT
_P$PL0_$$_ERROR$SMALLINT:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-16(%rsp),%rsp
	movq	%rbx,-16(%rbp)
	movw	%di,-8(%rbp)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$PL0$_Ld1@GOTPCREL(%rip),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movswl	_U_$P$PL0_$$_CC(%rip),%eax
	leal	-1(%eax),%edi
	movq	%rbx,%rsi
	movl	$32,%edx
	call	fpc_write_text_char
	call	FPC_IOCHECK
	movq	_$PL0$_Ld2@GOTPCREL(%rip),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movswq	-8(%rbp),%rdx
	movq	%rbx,%rsi
	movl	$2,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
	movswl	_U_$P$PL0_$$_ERR(%rip),%eax
	leal	1(%eax),%eax
	movw	%ax,_U_$P$PL0_$$_ERR(%rip)
	movq	-16(%rbp),%rbx
	leave
	ret

.text
	.align 3
.globl	_P$PL0_$$_GETSYM
_P$PL0_$$_GETSYM:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-544(%rsp),%rsp
	movq	%rbx,-536(%rbp)
	jmp	Lj40
	.align 2
Lj39:
	movq	%rbp,%rax
	movq	%rax,%rdi
	call	_P$PL0$_$GETSYM_$$_GETCH
Lj40:
	cmpb	$32,_U_$P$PL0_$$_CH(%rip)
	je	Lj39
	jmp	Lj41
Lj41:
	movzbl	_U_$P$PL0_$$_CH(%rip),%eax
	subl	$65,%eax
	cmpl	$26,%eax
	jb	Lj46
Lj46:
	jc	Lj44
	jmp	Lj45
Lj44:
	movw	$0,-12(%rbp)
	.align 2
Lj49:
	cmpw	$10,-12(%rbp)
	jl	Lj52
	jmp	Lj53
Lj52:
	movswl	-12(%rbp),%eax
	leal	1(%eax),%eax
	movw	%ax,-12(%rbp)
	movzwl	-12(%rbp),%eax
	movb	_U_$P$PL0_$$_CH(%rip),%dl
	leaq	_U_$P$PL0_$$_A(%rip),%rcx
	movb	%dl,-1(%rcx,%rax,1)
Lj53:
	movq	%rbp,%rdi
	call	_P$PL0$_$GETSYM_$$_GETCH
	movzbl	_U_$P$PL0_$$_CH(%rip),%eax
	subl	$48,%eax
	cmpl	$10,%eax
	jb	Lj60
	subl	$17,%eax
	cmpl	$26,%eax
	jb	Lj60
Lj60:
	jc	Lj51
	jmp	Lj49
Lj51:
	movw	-12(%rbp),%ax
	cmpw	_U_$P$PL0_$$_KK(%rip),%ax
	jge	Lj61
	jmp	Lj62
Lj61:
	movw	-12(%rbp),%ax
	movw	%ax,_U_$P$PL0_$$_KK(%rip)
	jmp	Lj65
Lj62:
	.align 2
Lj66:
	movzwl	_U_$P$PL0_$$_KK(%rip),%eax
	leaq	_U_$P$PL0_$$_A(%rip),%rdx
	movb	$32,-1(%rdx,%rax,1)
	movswl	_U_$P$PL0_$$_KK(%rip),%eax
	leal	-1(%eax),%eax
	movw	%ax,_U_$P$PL0_$$_KK(%rip)
	movw	_U_$P$PL0_$$_KK(%rip),%ax
	cmpw	-12(%rbp),%ax
	je	Lj68
	jmp	Lj66
Lj68:
Lj65:
	movq	_U_$P$PL0_$$_A(%rip),%rax
	movq	%rax,_U_$P$PL0_$$_ID(%rip)
	movw	_U_$P$PL0_$$_A+8(%rip),%ax
	movw	%ax,_U_$P$PL0_$$_ID+8(%rip)
	movw	$1,-4(%rbp)
	movw	$11,-8(%rbp)
	.align 2
Lj79:
	movswq	-4(%rbp),%rax
	movswq	-8(%rbp),%rdx
	leaq	(%rax,%rdx),%rax
	movq	%rax,%rdx
	sarq	$63,%rdx
	andq	$1,%rdx
	addq	%rdx,%rax
	sarq	$1,%rax
	movw	%ax,-12(%rbp)
	leaq	_U_$P$PL0_$$_ID(%rip),%rdx
	leaq	-268(%rbp),%rdi
	movl	$0,%r8d
	movq	$9,%rcx
	movq	$255,%rsi
	call	fpc_chararray_to_shortstr
	leaq	-268(%rbp),%rbx
	movzwl	-12(%rbp),%eax
	imulq	$10,%rax,%rax
	leaq	_U_$P$PL0_$$_WORD(%rip),%rdx
	leaq	-10(%rdx,%rax),%rdx
	leaq	-524(%rbp),%rdi
	movl	$0,%r8d
	movq	$9,%rcx
	movq	$255,%rsi
	call	fpc_chararray_to_shortstr
	leaq	-524(%rbp),%rsi
	movq	%rbx,%rdi
	call	fpc_shortstr_compare
	cmpl	$0,%eax
	jle	Lj84
	jmp	Lj85
Lj84:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-8(%rbp)
Lj85:
	leaq	_U_$P$PL0_$$_ID(%rip),%rdx
	leaq	-268(%rbp),%rdi
	movl	$0,%r8d
	movq	$9,%rcx
	movq	$255,%rsi
	call	fpc_chararray_to_shortstr
	leaq	-268(%rbp),%rbx
	movzwl	-12(%rbp),%eax
	imulq	$10,%rax,%rax
	leaq	_U_$P$PL0_$$_WORD(%rip),%rdx
	leaq	-10(%rdx,%rax),%rdx
	leaq	-524(%rbp),%rdi
	movl	$0,%r8d
	movq	$9,%rcx
	movq	$255,%rsi
	call	fpc_chararray_to_shortstr
	leaq	-524(%rbp),%rsi
	movq	%rbx,%rdi
	call	fpc_shortstr_compare
	cmpl	$0,%eax
	jge	Lj112
	jmp	Lj113
Lj112:
	movswl	-12(%rbp),%eax
	leal	1(%eax),%eax
	movw	%ax,-4(%rbp)
Lj113:
	movw	-4(%rbp),%ax
	cmpw	-8(%rbp),%ax
	jg	Lj81
	jmp	Lj79
Lj81:
	movswq	-4(%rbp),%rax
	leaq	-1(%rax),%rax
	movswq	-8(%rbp),%rdx
	cmpq	%rdx,%rax
	jg	Lj140
	jmp	Lj141
Lj140:
	movzwl	-12(%rbp),%edx
	leaq	_U_$P$PL0_$$_WSYM(%rip),%rax
	movl	-4(%rax,%rdx,4),%eax
	movl	%eax,_U_$P$PL0_$$_SYM(%rip)
	jmp	Lj144
Lj141:
	movl	$1,_U_$P$PL0_$$_SYM(%rip)
Lj144:
	jmp	Lj147
Lj45:
	movzbl	_U_$P$PL0_$$_CH(%rip),%eax
	subl	$48,%eax
	cmpl	$10,%eax
	jb	Lj150
Lj150:
	jc	Lj148
	jmp	Lj149
Lj148:
	movw	$0,-12(%rbp)
	movw	$0,_U_$P$PL0_$$_NUM(%rip)
	movl	$2,_U_$P$PL0_$$_SYM(%rip)
	.align 2
Lj157:
	movswl	_U_$P$PL0_$$_NUM(%rip),%eax
	imull	$10,%eax,%edx
	movzbl	_U_$P$PL0_$$_CH(%rip),%eax
	leal	(%edx,%eax),%eax
	movw	%ax,_U_$P$PL0_$$_NUM(%rip)
	movswl	-12(%rbp),%eax
	leal	1(%eax),%eax
	movw	%ax,-12(%rbp)
	movq	%rbp,%rdi
	call	_P$PL0$_$GETSYM_$$_GETCH
	movzbl	_U_$P$PL0_$$_CH(%rip),%eax
	subl	$48,%eax
	cmpl	$10,%eax
	jb	Lj166
Lj166:
	jc	Lj159
	jmp	Lj157
Lj159:
	cmpw	$14,-12(%rbp)
	jg	Lj167
	jmp	Lj168
Lj167:
	movl	$30,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj168:
	jmp	Lj171
Lj149:
	cmpb	$58,_U_$P$PL0_$$_CH(%rip)
	je	Lj172
	jmp	Lj173
Lj172:
	movq	%rbp,%rdi
	call	_P$PL0$_$GETSYM_$$_GETCH
	cmpb	$61,_U_$P$PL0_$$_CH(%rip)
	je	Lj176
	jmp	Lj177
Lj176:
	movl	$19,_U_$P$PL0_$$_SYM(%rip)
	movq	%rbp,%rdi
	call	_P$PL0$_$GETSYM_$$_GETCH
	jmp	Lj182
Lj177:
	movl	$0,_U_$P$PL0_$$_SYM(%rip)
Lj182:
	jmp	Lj185
Lj173:
	movzbl	_U_$P$PL0_$$_CH(%rip),%edx
	leaq	_U_$P$PL0_$$_SSYM(%rip),%rax
	movl	(%rax,%rdx,4),%eax
	movl	%eax,_U_$P$PL0_$$_SYM(%rip)
	movq	%rbp,%rdi
	call	_P$PL0$_$GETSYM_$$_GETCH
Lj185:
Lj171:
Lj147:
	movq	-536(%rbp),%rbx
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$GETSYM_$$_GETCH
_P$PL0$_$GETSYM_$$_GETCH:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-16(%rsp),%rsp
	movq	%rbx,-16(%rbp)
	movq	%rdi,-8(%rbp)
	movw	_U_$P$PL0_$$_CC(%rip),%ax
	cmpw	_U_$P$PL0_$$_LL(%rip),%ax
	je	Lj190
	jmp	Lj191
Lj190:
	movq	FPC_THREADVAR_RELOCATE@GOTPCREL(%rip),%rax
	movq	(%rax),%rdx
	testq	%rdx,%rdx
	je	Lj196
	movq	_U_$SYSTEM_$$_INPUT@GOTPCREL(%rip),%rax
	movl	(%rax),%edi
	call	*%rdx
	movq	%rax,%rdi
	jmp	Lj197
Lj196:
	movq	_U_$SYSTEM_$$_INPUT@GOTPCREL(%rip),%rdi
	addq	$8,%rdi
Lj197:
	call	_SYSTEM_$$_EOF$TEXT$$BOOLEAN
	movb	%al,%bl
	call	FPC_IOCHECK
	testb	%bl,%bl
	jne	Lj192
	jmp	Lj193
Lj192:
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$PL0$_Ld3@GOTPCREL(%rip),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_write_end
	call	FPC_IOCHECK
	jmp	Lj37
Lj193:
	movw	$0,_U_$P$PL0_$$_LL(%rip)
	movw	$0,_U_$P$PL0_$$_CC(%rip)
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	_U_$P$PL0_$$_CX(%rip),%rdx
	movq	%rbx,%rsi
	movl	$5,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rsi
	movl	$32,%edx
	movl	$0,%edi
	call	fpc_write_text_char
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_write_end
	call	FPC_IOCHECK
	jmp	Lj229
	.align 2
Lj228:
	movswl	_U_$P$PL0_$$_LL(%rip),%eax
	leal	1(%eax),%eax
	movw	%ax,_U_$P$PL0_$$_LL(%rip)
	call	fpc_get_input
	movq	%rax,%rbx
	leaq	_U_$P$PL0_$$_CH(%rip),%rsi
	movq	%rbx,%rdi
	call	fpc_read_text_char
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_read_end
	call	FPC_IOCHECK
	call	fpc_get_output
	movq	%rax,%rbx
	movzbl	_U_$P$PL0_$$_CH(%rip),%edx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_char
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_write_end
	call	FPC_IOCHECK
	movzwl	_U_$P$PL0_$$_LL(%rip),%eax
	movb	_U_$P$PL0_$$_CH(%rip),%dl
	leaq	_U_$P$PL0_$$_LINE(%rip),%rcx
	movb	%dl,-1(%rcx,%rax,1)
Lj229:
	movq	FPC_THREADVAR_RELOCATE@GOTPCREL(%rip),%rax
	movq	(%rax),%rdx
	testq	%rdx,%rdx
	je	Lj255
	movq	_U_$SYSTEM_$$_INPUT@GOTPCREL(%rip),%rax
	movl	(%rax),%edi
	call	*%rdx
	movq	%rax,%rdi
	jmp	Lj256
Lj255:
	movq	_U_$SYSTEM_$$_INPUT@GOTPCREL(%rip),%rdi
	addq	$8,%rdi
Lj256:
	call	_SYSTEM_$$_EOLN$TEXT$$BOOLEAN
	testb	%al,%al
	jne	Lj228
	jmp	Lj230
Lj230:
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
	movswl	_U_$P$PL0_$$_LL(%rip),%eax
	leal	1(%eax),%eax
	movw	%ax,_U_$P$PL0_$$_LL(%rip)
	call	fpc_get_input
	movq	%rax,%rbx
	movzwl	_U_$P$PL0_$$_LL(%rip),%eax
	leaq	_U_$P$PL0_$$_LINE(%rip),%rdx
	leaq	-1(%rdx,%rax,1),%rsi
	movq	%rbx,%rdi
	call	fpc_read_text_char
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_read_end
	call	FPC_IOCHECK
Lj191:
	movswl	_U_$P$PL0_$$_CC(%rip),%eax
	leal	1(%eax),%eax
	movw	%ax,_U_$P$PL0_$$_CC(%rip)
	movzwl	_U_$P$PL0_$$_CC(%rip),%edx
	leaq	_U_$P$PL0_$$_LINE(%rip),%rax
	movb	-1(%rax,%rdx,1),%al
	movb	%al,_U_$P$PL0_$$_CH(%rip)
Lj37:
	movq	-16(%rbp),%rbx
	leave
	ret

.text
	.align 3
.globl	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-32(%rsp),%rsp
	movq	%rbx,-32(%rbp)
	movl	%edi,-8(%rbp)
	movw	%si,-16(%rbp)
	movw	%dx,-24(%rbp)
	cmpw	$200,_U_$P$PL0_$$_CX(%rip)
	jg	Lj277
	jmp	Lj278
Lj277:
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$PL0$_Ld4@GOTPCREL(%rip),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_write_end
	call	FPC_IOCHECK
	jmp	Lj275
Lj278:
	movzwl	_U_$P$PL0_$$_CX(%rip),%eax
	imulq	$7,%rax,%rax
	leaq	_U_$P$PL0_$$_CODE(%rip),%rdx
	leaq	(%rdx,%rax),%rax
	movl	-8(%rbp),%edx
	movl	%edx,(%rax)
	movb	-16(%rbp),%dl
	movb	%dl,4(%rax)
	movw	-24(%rbp),%dx
	movw	%dx,5(%rax)
	movswl	_U_$P$PL0_$$_CX(%rip),%eax
	leal	1(%eax),%eax
	movw	%ax,_U_$P$PL0_$$_CX(%rip)
Lj275:
	movq	-32(%rbp),%rbx
	leave
	ret

.text
	.align 3
.globl	_P$PL0_$$_TEST$SYMSET$SYMSET$SMALLINT
_P$PL0_$$_TEST$SYMSET$SYMSET$SMALLINT:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-32(%rsp),%rsp
	movl	%edi,-8(%rbp)
	movl	%esi,-16(%rbp)
	movw	%dx,-24(%rbp)
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	btl	%eax,-8(%rbp)
	jc	Lj301
	jmp	Lj302
Lj301:
	movswl	-24(%rbp),%edi
	call	_P$PL0_$$_ERROR$SMALLINT
	movl	-8(%rbp),%eax
	orl	-16(%rbp),%eax
	movl	%eax,-8(%rbp)
	jmp	Lj308
	.align 2
Lj307:
	call	_P$PL0_$$_GETSYM
Lj308:
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	btl	%eax,-8(%rbp)
	jc	Lj307
	jmp	Lj309
Lj309:
Lj302:
	leave
	ret

.text
	.align 3
.globl	_P$PL0_$$_BLOCK$SMALLINT$SMALLINT$SYMSET
_P$PL0_$$_BLOCK$SMALLINT$SMALLINT$SYMSET:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-48(%rsp),%rsp
	movw	%di,-8(%rbp)
	movw	%si,-16(%rbp)
	movl	%edx,-24(%rbp)
	movw	$3,-28(%rbp)
	movw	-16(%rbp),%ax
	movw	%ax,-32(%rbp)
	movzwl	-16(%rbp),%eax
	imulq	$20,%rax,%rdx
	movw	_U_$P$PL0_$$_CX(%rip),%cx
	leaq	_U_$P$PL0_$$_TABLE(%rip),%rax
	movw	%cx,18(%rax,%rdx)
	movl	$0,%edx
	movl	$0,%esi
	movl	$6,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	cmpw	$3,-8(%rbp)
	jg	Lj344
	jmp	Lj345
Lj344:
	movl	$32,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj345:
	.align 2
Lj348:
	cmpl	$27,_U_$P$PL0_$$_SYM(%rip)
	je	Lj351
	jmp	Lj352
Lj351:
	call	_P$PL0_$$_GETSYM
	.align 2
Lj353:
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_CONSTDECLARATION
	jmp	Lj359
	.align 2
Lj358:
	call	_P$PL0_$$_GETSYM
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_CONSTDECLARATION
Lj359:
	cmpl	$16,_U_$P$PL0_$$_SYM(%rip)
	je	Lj358
	jmp	Lj360
Lj360:
	cmpl	$17,_U_$P$PL0_$$_SYM(%rip)
	je	Lj363
	jmp	Lj364
Lj363:
	call	_P$PL0_$$_GETSYM
	jmp	Lj365
Lj364:
	movl	$5,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj365:
	cmpl	$1,_U_$P$PL0_$$_SYM(%rip)
	jne	Lj355
	jmp	Lj353
Lj355:
Lj352:
	cmpl	$28,_U_$P$PL0_$$_SYM(%rip)
	je	Lj368
	jmp	Lj369
Lj368:
	call	_P$PL0_$$_GETSYM
	.align 2
Lj370:
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_VARDECLARATION
	jmp	Lj376
	.align 2
Lj375:
	call	_P$PL0_$$_GETSYM
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_VARDECLARATION
Lj376:
	cmpl	$16,_U_$P$PL0_$$_SYM(%rip)
	je	Lj375
	jmp	Lj377
Lj377:
	cmpl	$17,_U_$P$PL0_$$_SYM(%rip)
	je	Lj380
	jmp	Lj381
Lj380:
	call	_P$PL0_$$_GETSYM
	jmp	Lj382
Lj381:
	movl	$5,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj382:
	cmpl	$1,_U_$P$PL0_$$_SYM(%rip)
	jne	Lj372
	jmp	Lj370
Lj372:
Lj369:
	jmp	Lj386
	.align 2
Lj385:
	call	_P$PL0_$$_GETSYM
	cmpl	$1,_U_$P$PL0_$$_SYM(%rip)
	je	Lj388
	jmp	Lj389
Lj388:
	movq	%rbp,%rdi
	movl	$2,%esi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_ENTER$OBJ
	call	_P$PL0_$$_GETSYM
	jmp	Lj394
Lj389:
	movl	$4,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj394:
	cmpl	$17,_U_$P$PL0_$$_SYM(%rip)
	je	Lj397
	jmp	Lj398
Lj397:
	call	_P$PL0_$$_GETSYM
	jmp	Lj399
Lj398:
	movl	$5,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj399:
	movswl	-8(%rbp),%eax
	leal	1(%eax),%edi
	movswl	%di,%edi
	movl	$131072,%edx
	orl	-24(%rbp),%edx
	movswl	-16(%rbp),%esi
	call	_P$PL0_$$_BLOCK$SMALLINT$SMALLINT$SYMSET
	cmpl	$17,_U_$P$PL0_$$_SYM(%rip)
	je	Lj408
	jmp	Lj409
Lj408:
	call	_P$PL0_$$_GETSYM
	movl	-24(%rbp),%esi
	movl	_U_$P$PL0_$$_STATBEGSYS(%rip),%edi
	orl	$536870914,%edi
	movl	$6,%edx
	call	_P$PL0_$$_TEST$SYMSET$SYMSET$SMALLINT
	jmp	Lj416
Lj409:
	movl	$5,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj416:
Lj386:
	cmpl	$29,_U_$P$PL0_$$_SYM(%rip)
	je	Lj385
	jmp	Lj387
Lj387:
	movl	_U_$P$PL0_$$_DECLBEGSYS(%rip),%esi
	movl	_U_$P$PL0_$$_STATBEGSYS(%rip),%edi
	orl	$2,%edi
	movl	$7,%edx
	call	_P$PL0_$$_TEST$SYMSET$SYMSET$SMALLINT
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	btl	%eax,_U_$P$PL0_$$_DECLBEGSYS(%rip)
	jc	Lj350
	jmp	Lj348
Lj350:
	movzwl	-32(%rbp),%eax
	imulq	$20,%rax,%rax
	leaq	_U_$P$PL0_$$_TABLE(%rip),%rdx
	movzwl	18(%rdx,%rax),%eax
	imulq	$7,%rax,%rax
	movw	_U_$P$PL0_$$_CX(%rip),%dx
	leaq	_U_$P$PL0_$$_CODE(%rip),%rcx
	movw	%dx,5(%rcx,%rax)
	movzwl	-32(%rbp),%eax
	imulq	$20,%rax,%rax
	leaq	_U_$P$PL0_$$_TABLE(%rip),%rdx
	leaq	(%rdx,%rax),%rax
	movw	_U_$P$PL0_$$_CX(%rip),%dx
	movw	%dx,18(%rax)
	movw	_U_$P$PL0_$$_CX(%rip),%ax
	movw	%ax,-36(%rbp)
	movswl	-28(%rbp),%edx
	movl	$0,%esi
	movl	$5,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	movl	$2228224,%esi
	orl	-24(%rbp),%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_STATEMENT$SYMSET
	movl	$0,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	movl	$0,%esi
	movl	-24(%rbp),%edi
	movl	$8,%edx
	call	_P$PL0_$$_TEST$SYMSET$SYMSET$SMALLINT
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_LISTCODE
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_STATEMENT$SYMSET
_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_STATEMENT$SYMSET:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-48(%rsp),%rsp
	movq	%rbx,-40(%rbp)
	movq	%rdi,-16(%rbp)
	movl	%esi,-8(%rbp)
	cmpl	$1,_U_$P$PL0_$$_SYM(%rip)
	je	Lj457
	jmp	Lj458
Lj457:
	leaq	_U_$P$PL0_$$_ID(%rip),%rax
	movq	-16(%rbp),%rdi
	movq	%rax,%rsi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_POSITION$ALFA$$SMALLINT
	movw	%ax,-20(%rbp)
	cmpw	$0,-20(%rbp)
	je	Lj465
	jmp	Lj466
Lj465:
	movl	$11,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
	jmp	Lj469
Lj466:
	movzwl	-20(%rbp),%eax
	imulq	$20,%rax,%rax
	leaq	_U_$P$PL0_$$_TABLE(%rip),%rdx
	cmpl	$1,12(%rdx,%rax)
	jne	Lj470
	jmp	Lj471
Lj470:
	movl	$12,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
	movw	$0,-20(%rbp)
Lj471:
Lj469:
	call	_P$PL0_$$_GETSYM
	cmpl	$19,_U_$P$PL0_$$_SYM(%rip)
	je	Lj476
	jmp	Lj477
Lj476:
	call	_P$PL0_$$_GETSYM
	jmp	Lj478
Lj477:
	movl	$13,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj478:
	movl	-8(%rbp),%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_$$_EXPRESSION$SYMSET
	cmpw	$0,-20(%rbp)
	jne	Lj485
	jmp	Lj486
Lj485:
	movzwl	-20(%rbp),%eax
	imulq	$20,%rax,%rax
	leaq	_U_$P$PL0_$$_TABLE(%rip),%rdx
	leaq	(%rdx,%rax),%rbx
	movswl	18(%rbx),%edx
	movq	-16(%rbp),%rax
	movswl	-8(%rax),%esi
	movswl	16(%rbx),%eax
	subl	%eax,%esi
	movswl	%si,%esi
	movl	$3,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
Lj486:
	jmp	Lj495
Lj458:
	cmpl	$26,_U_$P$PL0_$$_SYM(%rip)
	je	Lj496
	jmp	Lj497
Lj496:
	call	_P$PL0_$$_GETSYM
	cmpl	$1,_U_$P$PL0_$$_SYM(%rip)
	jne	Lj498
	jmp	Lj499
Lj498:
	movl	$14,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
	jmp	Lj502
Lj499:
	leaq	_U_$P$PL0_$$_ID(%rip),%rsi
	movq	-16(%rbp),%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_POSITION$ALFA$$SMALLINT
	movw	%ax,-20(%rbp)
	cmpw	$0,-20(%rbp)
	je	Lj509
	jmp	Lj510
Lj509:
	movl	$11,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
	jmp	Lj513
Lj510:
	movzwl	-20(%rbp),%eax
	imulq	$20,%rax,%rax
	leaq	_U_$P$PL0_$$_TABLE(%rip),%rdx
	leaq	(%rdx,%rax),%rbx
	cmpl	$2,12(%rbx)
	je	Lj516
	jmp	Lj517
Lj516:
	movswl	18(%rbx),%edx
	movq	-16(%rbp),%rax
	movswl	-8(%rax),%esi
	movswl	16(%rbx),%eax
	subl	%eax,%esi
	movswl	%si,%esi
	movl	$4,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj524
Lj517:
	movl	$15,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj524:
Lj513:
	call	_P$PL0_$$_GETSYM
Lj502:
	jmp	Lj527
Lj497:
	cmpl	$22,_U_$P$PL0_$$_SYM(%rip)
	je	Lj528
	jmp	Lj529
Lj528:
	call	_P$PL0_$$_GETSYM
	movl	$41943040,%esi
	orl	-8(%rbp),%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_$$_CONDITION$SYMSET
	cmpl	$23,_U_$P$PL0_$$_SYM(%rip)
	je	Lj534
	jmp	Lj535
Lj534:
	call	_P$PL0_$$_GETSYM
	jmp	Lj536
Lj535:
	movl	$16,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj536:
	movw	_U_$P$PL0_$$_CX(%rip),%ax
	movw	%ax,-24(%rbp)
	movl	$0,%edx
	movl	$0,%esi
	movl	$7,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	movl	-8(%rbp),%esi
	movq	-16(%rbp),%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_STATEMENT$SYMSET
	movzwl	-24(%rbp),%eax
	imulq	$7,%rax,%rax
	movw	_U_$P$PL0_$$_CX(%rip),%dx
	leaq	_U_$P$PL0_$$_CODE(%rip),%rcx
	movw	%dx,5(%rcx,%rax)
	jmp	Lj553
Lj529:
	cmpl	$20,_U_$P$PL0_$$_SYM(%rip)
	je	Lj554
	jmp	Lj555
Lj554:
	call	_P$PL0_$$_GETSYM
	movl	$2228224,%esi
	orl	-8(%rbp),%esi
	movq	-16(%rbp),%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_STATEMENT$SYMSET
	jmp	Lj561
	.align 2
Lj560:
	cmpl	$17,_U_$P$PL0_$$_SYM(%rip)
	je	Lj563
	jmp	Lj564
Lj563:
	call	_P$PL0_$$_GETSYM
	jmp	Lj565
Lj564:
	movl	$10,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj565:
	movl	$2228224,%esi
	orl	-8(%rbp),%esi
	movq	-16(%rbp),%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_STATEMENT$SYMSET
Lj561:
	movl	$131072,%edx
	orl	_U_$P$PL0_$$_STATBEGSYS(%rip),%edx
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	btl	%eax,%edx
	jc	Lj560
	jmp	Lj562
Lj562:
	cmpl	$21,_U_$P$PL0_$$_SYM(%rip)
	je	Lj572
	jmp	Lj573
Lj572:
	call	_P$PL0_$$_GETSYM
	jmp	Lj574
Lj573:
	movl	$17,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj574:
	jmp	Lj577
Lj555:
	cmpl	$24,_U_$P$PL0_$$_SYM(%rip)
	je	Lj578
	jmp	Lj579
Lj578:
	movw	_U_$P$PL0_$$_CX(%rip),%ax
	movw	%ax,-24(%rbp)
	call	_P$PL0_$$_GETSYM
	movl	$33554432,%esi
	orl	-8(%rbp),%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_$$_CONDITION$SYMSET
	movw	_U_$P$PL0_$$_CX(%rip),%ax
	movw	%ax,-28(%rbp)
	movl	$0,%edx
	movl	$0,%esi
	movl	$7,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	cmpl	$25,_U_$P$PL0_$$_SYM(%rip)
	je	Lj594
	jmp	Lj595
Lj594:
	call	_P$PL0_$$_GETSYM
	jmp	Lj596
Lj595:
	movl	$18,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj596:
	movl	-8(%rbp),%esi
	movq	-16(%rbp),%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_STATEMENT$SYMSET
	movswl	-24(%rbp),%edx
	movl	$0,%esi
	movl	$6,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	movzwl	-28(%rbp),%eax
	imulq	$7,%rax,%rax
	movw	_U_$P$PL0_$$_CX(%rip),%dx
	leaq	_U_$P$PL0_$$_CODE(%rip),%rcx
	movw	%dx,5(%rcx,%rax)
Lj579:
Lj577:
Lj553:
Lj527:
Lj495:
	movl	$0,%esi
	movl	-8(%rbp),%edi
	movl	$19,%edx
	call	_P$PL0_$$_TEST$SYMSET$SYMSET$SMALLINT
	movq	-40(%rbp),%rbx
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_$$_CONDITION$SYMSET
_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_$$_CONDITION$SYMSET:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-32(%rsp),%rsp
	movq	%rdi,-16(%rbp)
	movl	%esi,-8(%rbp)
	cmpl	$7,_U_$P$PL0_$$_SYM(%rip)
	je	Lj617
	jmp	Lj618
Lj617:
	call	_P$PL0_$$_GETSYM
	movl	-8(%rbp),%eax
	movq	-16(%rbp),%rdi
	movl	%eax,%esi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_$$_EXPRESSION$SYMSET
	movl	$6,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj629
Lj618:
	movl	$16128,%esi
	orl	-8(%rbp),%esi
	movq	-16(%rbp),%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_$$_EXPRESSION$SYMSET
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	subl	$8,%eax
	cmpl	$6,%eax
	jb	Lj636
Lj636:
	jc	Lj634
	jmp	Lj635
Lj634:
	movl	$20,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
	jmp	Lj639
Lj635:
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	movl	%eax,-20(%rbp)
	call	_P$PL0_$$_GETSYM
	movl	-8(%rbp),%esi
	movq	-16(%rbp),%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_$$_EXPRESSION$SYMSET
	movl	-20(%rbp),%eax
	cmpl	$8,%eax
	jb	Lj647
	subl	$8,%eax
	je	Lj648
	subl	$1,%eax
	je	Lj649
	subl	$1,%eax
	je	Lj650
	subl	$1,%eax
	je	Lj653
	subl	$1,%eax
	je	Lj652
	subl	$1,%eax
	je	Lj651
	jmp	Lj647
Lj648:
	movl	$8,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj646
Lj649:
	movl	$9,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj646
Lj650:
	movl	$10,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj646
Lj651:
	movl	$11,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj646
Lj652:
	movl	$12,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj646
Lj653:
	movl	$13,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj646
Lj647:
Lj646:
Lj639:
Lj629:
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_$$_EXPRESSION$SYMSET
_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_$$_EXPRESSION$SYMSET:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-32(%rsp),%rsp
	movq	%rdi,-16(%rbp)
	movl	%esi,-8(%rbp)
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	subl	$3,%eax
	cmpl	$2,%eax
	jb	Lj692
Lj692:
	jc	Lj690
	jmp	Lj691
Lj690:
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	movl	%eax,-20(%rbp)
	call	_P$PL0_$$_GETSYM
	movl	-8(%rbp),%esi
	orl	$24,%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_EXPRESSION$SYMSET_$$_TERM$SYMSET
	cmpl	$4,-20(%rbp)
	je	Lj699
	jmp	Lj700
Lj699:
	movl	$1,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
Lj700:
	jmp	Lj707
Lj691:
	movl	-8(%rbp),%esi
	orl	$24,%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_EXPRESSION$SYMSET_$$_TERM$SYMSET
Lj707:
	jmp	Lj713
	.align 2
Lj712:
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	movl	%eax,-20(%rbp)
	call	_P$PL0_$$_GETSYM
	movl	-8(%rbp),%esi
	orl	$24,%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_EXPRESSION$SYMSET_$$_TERM$SYMSET
	cmpl	$3,-20(%rbp)
	je	Lj721
	jmp	Lj722
Lj721:
	movl	$2,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj729
Lj722:
	movl	$3,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
Lj729:
Lj713:
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	subl	$3,%eax
	cmpl	$2,%eax
	jb	Lj736
Lj736:
	jc	Lj712
	jmp	Lj714
Lj714:
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_EXPRESSION$SYMSET_$$_TERM$SYMSET
_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_EXPRESSION$SYMSET_$$_TERM$SYMSET:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-32(%rsp),%rsp
	movq	%rdi,-16(%rbp)
	movl	%esi,-8(%rbp)
	movl	-8(%rbp),%eax
	orl	$96,%eax
	movl	%eax,%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_EXPRESSION$SYMSET_TERM$SYMSET_$$_FACTOR$SYMSET
	jmp	Lj742
	.align 2
Lj741:
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	movl	%eax,-20(%rbp)
	call	_P$PL0_$$_GETSYM
	movl	-8(%rbp),%esi
	orl	$96,%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_EXPRESSION$SYMSET_TERM$SYMSET_$$_FACTOR$SYMSET
	cmpl	$5,-20(%rbp)
	je	Lj750
	jmp	Lj751
Lj750:
	movl	$4,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj758
Lj751:
	movl	$5,%edx
	movl	$0,%esi
	movl	$1,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
Lj758:
Lj742:
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	subl	$5,%eax
	cmpl	$2,%eax
	jb	Lj765
Lj765:
	jc	Lj741
	jmp	Lj743
Lj743:
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_EXPRESSION$SYMSET_TERM$SYMSET_$$_FACTOR$SYMSET
_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_EXPRESSION$SYMSET_TERM$SYMSET_$$_FACTOR$SYMSET:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-32(%rsp),%rsp
	movq	%rbx,-32(%rbp)
	movq	%rdi,-16(%rbp)
	movl	%esi,-8(%rbp)
	movl	-8(%rbp),%eax
	movl	_U_$P$PL0_$$_FACBEGSYS(%rip),%edi
	movl	$24,%edx
	movl	%eax,%esi
	call	_P$PL0_$$_TEST$SYMSET$SYMSET$SMALLINT
	jmp	Lj773
	.align 2
Lj772:
	cmpl	$1,_U_$P$PL0_$$_SYM(%rip)
	je	Lj775
	jmp	Lj776
Lj775:
	leaq	_U_$P$PL0_$$_ID(%rip),%rsi
	movq	-16(%rbp),%rdi
	movq	-16(%rdi),%rdi
	movq	-16(%rdi),%rdi
	movq	-16(%rdi),%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_POSITION$ALFA$$SMALLINT
	movw	%ax,-20(%rbp)
	cmpw	$0,-20(%rbp)
	je	Lj783
	jmp	Lj784
Lj783:
	movl	$11,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
	jmp	Lj787
Lj784:
	movzwl	-20(%rbp),%eax
	imulq	$20,%rax,%rax
	leaq	_U_$P$PL0_$$_TABLE(%rip),%rdx
	leaq	(%rdx,%rax),%rbx
	movl	12(%rbx),%eax
	testl	%eax,%eax
	je	Lj792
	subl	$1,%eax
	je	Lj793
	subl	$1,%eax
	je	Lj794
	jmp	Lj791
Lj792:
	movswl	16(%rbx),%edx
	movl	$0,%esi
	movl	$0,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj790
Lj793:
	movswl	18(%rbx),%edx
	movq	-16(%rbp),%rax
	movq	-16(%rax),%rax
	movq	-16(%rax),%rax
	movq	-16(%rax),%rax
	movswl	-8(%rax),%esi
	movswl	16(%rbx),%eax
	subl	%eax,%esi
	movswl	%si,%esi
	movl	$2,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	jmp	Lj790
Lj794:
	movl	$21,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
	jmp	Lj790
Lj791:
Lj790:
Lj787:
	call	_P$PL0_$$_GETSYM
	jmp	Lj809
Lj776:
	cmpl	$2,_U_$P$PL0_$$_SYM(%rip)
	je	Lj810
	jmp	Lj811
Lj810:
	cmpw	$2047,_U_$P$PL0_$$_NUM(%rip)
	jg	Lj812
	jmp	Lj813
Lj812:
	movl	$30,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
	movw	$0,_U_$P$PL0_$$_NUM(%rip)
Lj813:
	movswl	_U_$P$PL0_$$_NUM(%rip),%edx
	movl	$0,%esi
	movl	$0,%edi
	call	_P$PL0_$$_GEN$FCT$SMALLINT$SMALLINT
	call	_P$PL0_$$_GETSYM
	jmp	Lj824
Lj811:
	cmpl	$14,_U_$P$PL0_$$_SYM(%rip)
	je	Lj825
	jmp	Lj826
Lj825:
	call	_P$PL0_$$_GETSYM
	movl	$32768,%esi
	orl	-8(%rbp),%esi
	movq	-16(%rbp),%rdi
	movq	-16(%rdi),%rdi
	movq	-16(%rdi),%rdi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_STATEMENT$SYMSET_$$_EXPRESSION$SYMSET
	cmpl	$15,_U_$P$PL0_$$_SYM(%rip)
	je	Lj831
	jmp	Lj832
Lj831:
	call	_P$PL0_$$_GETSYM
	jmp	Lj833
Lj832:
	movl	$22,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj833:
Lj826:
Lj824:
Lj809:
	movl	$16384,%esi
	movl	-8(%rbp),%edi
	movl	$23,%edx
	call	_P$PL0_$$_TEST$SYMSET$SYMSET$SMALLINT
Lj773:
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	btl	%eax,_U_$P$PL0_$$_FACBEGSYS(%rip)
	jc	Lj772
	jmp	Lj774
Lj774:
	movq	-32(%rbp),%rbx
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_LISTCODE
_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_LISTCODE:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-48(%rsp),%rsp
	movq	%rbx,-40(%rbp)
	movq	%r12,-32(%rbp)
	movq	%r13,-24(%rbp)
	movq	%rdi,-8(%rbp)
	movswl	_U_$P$PL0_$$_CX(%rip),%eax
	leal	-1(%eax),%ebx
	movq	-8(%rbp),%rax
	movw	-36(%rax),%ax
	movw	%ax,-12(%rbp)
	cmpw	-12(%rbp),%bx
	jl	Lj845
	subw	$1,-12(%rbp)
	.align 2
Lj846:
	addw	$1,-12(%rbp)
	movzwl	-12(%rbp),%eax
	imulq	$7,%rax,%rax
	leaq	_U_$P$PL0_$$_CODE(%rip),%rdx
	leaq	(%rdx,%rax),%r12
	call	fpc_get_output
	movq	%rax,%r13
	movswq	-12(%rbp),%rdx
	movq	%r13,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movl	(%r12),%eax
	leaq	(%rax,%rax,4),%rax
	leaq	_U_$P$PL0_$$_MNEMONIC(%rip),%rdx
	leaq	(%rdx,%rax),%rdx
	movq	%r13,%rsi
	movl	$0,%r8d
	movq	$4,%rcx
	movl	$5,%edi
	call	fpc_write_text_pchar_as_array
	call	FPC_IOCHECK
	movzbl	4(%r12),%edx
	movq	%r13,%rsi
	movl	$3,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movzwl	5(%r12),%edx
	movq	%r13,%rsi
	movl	$5,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%r13,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
	cmpw	-12(%rbp),%bx
	jg	Lj846
Lj845:
	movq	-40(%rbp),%rbx
	movq	-32(%rbp),%r12
	movq	-24(%rbp),%r13
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_VARDECLARATION
_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_VARDECLARATION:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-16(%rsp),%rsp
	movq	%rdi,-8(%rbp)
	cmpl	$1,_U_$P$PL0_$$_SYM(%rip)
	je	Lj881
	jmp	Lj882
Lj881:
	movq	-8(%rbp),%rax
	movq	%rax,%rdi
	movl	$1,%esi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_ENTER$OBJ
	call	_P$PL0_$$_GETSYM
	jmp	Lj887
Lj882:
	movl	$4,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj887:
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_CONSTDECLARATION
_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_CONSTDECLARATION:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-16(%rsp),%rsp
	movq	%rdi,-8(%rbp)
	cmpl	$1,_U_$P$PL0_$$_SYM(%rip)
	je	Lj890
	jmp	Lj891
Lj890:
	call	_P$PL0_$$_GETSYM
	movl	_U_$P$PL0_$$_SYM(%rip),%eax
	cmpl	$8,%eax
	je	Lj894
	cmpl	$19,%eax
	je	Lj894
Lj894:
	je	Lj892
	jmp	Lj893
Lj892:
	cmpl	$19,_U_$P$PL0_$$_SYM(%rip)
	je	Lj895
	jmp	Lj896
Lj895:
	movl	$1,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj896:
	call	_P$PL0_$$_GETSYM
	cmpl	$2,_U_$P$PL0_$$_SYM(%rip)
	je	Lj899
	jmp	Lj900
Lj899:
	movq	-8(%rbp),%rdi
	movl	$0,%esi
	call	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_ENTER$OBJ
	call	_P$PL0_$$_GETSYM
	jmp	Lj905
Lj900:
	movl	$2,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj905:
	jmp	Lj908
Lj893:
	movl	$3,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj908:
	jmp	Lj911
Lj891:
	movl	$4,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj911:
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_POSITION$ALFA$$SMALLINT
_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_POSITION$ALFA$$SMALLINT:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-560(%rsp),%rsp
	movq	%rbx,-560(%rbp)
	movq	%rdi,-16(%rbp)
	movq	%rsi,-8(%rbp)
	movq	-8(%rbp),%rax
	movq	(%rax),%rdx
	movq	%rdx,-36(%rbp)
	movw	8(%rax),%ax
	movw	%ax,-28(%rbp)
	movq	-36(%rbp),%rax
	movq	%rax,_U_$P$PL0_$$_TABLE(%rip)
	movw	-28(%rbp),%ax
	movw	%ax,_U_$P$PL0_$$_TABLE+8(%rip)
	movq	-16(%rbp),%rax
	movw	-16(%rax),%ax
	movw	%ax,-24(%rbp)
	jmp	Lj919
	.align 2
Lj918:
	movswl	-24(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-24(%rbp)
Lj919:
	movzwl	-24(%rbp),%eax
	imulq	$20,%rax,%rdx
	leaq	_U_$P$PL0_$$_TABLE(%rip),%rax
	leaq	(%rax,%rdx),%rdx
	leaq	-292(%rbp),%rdi
	movl	$0,%r8d
	movq	$9,%rcx
	movq	$255,%rsi
	call	fpc_chararray_to_shortstr
	leaq	-292(%rbp),%rbx
	leaq	-36(%rbp),%rdx
	leaq	-548(%rbp),%rdi
	movl	$0,%r8d
	movq	$9,%rcx
	movq	$255,%rsi
	call	fpc_chararray_to_shortstr
	leaq	-548(%rbp),%rsi
	movq	%rbx,%rdi
	call	fpc_shortstr_compare_equal
	testl	%eax,%eax
	jne	Lj918
	jmp	Lj920
Lj920:
	movw	-24(%rbp),%ax
	movw	%ax,-20(%rbp)
	movswl	-20(%rbp),%eax
	movq	-560(%rbp),%rbx
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_ENTER$OBJ
_P$PL0$_$BLOCK$SMALLINT$SMALLINT$SYMSET_$$_ENTER$OBJ:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-32(%rsp),%rsp
	movq	%rbx,-24(%rbp)
	movq	%rdi,-16(%rbp)
	movl	%esi,-8(%rbp)
	movq	-16(%rbp),%rax
	movswl	-16(%rax),%eax
	leal	1(%eax),%eax
	movq	-16(%rbp),%rdx
	movw	%ax,-16(%rdx)
	movq	-16(%rbp),%rax
	movzwl	-16(%rax),%eax
	imulq	$20,%rax,%rax
	leaq	_U_$P$PL0_$$_TABLE(%rip),%rdx
	leaq	(%rdx,%rax),%rbx
	movq	_U_$P$PL0_$$_ID(%rip),%rax
	movq	%rax,(%rbx)
	movw	_U_$P$PL0_$$_ID+8(%rip),%ax
	movw	%ax,8(%rbx)
	movl	-8(%rbp),%eax
	movl	%eax,12(%rbx)
	movl	-8(%rbp),%eax
	testl	%eax,%eax
	je	Lj959
	subl	$1,%eax
	je	Lj960
	subl	$1,%eax
	je	Lj961
	jmp	Lj958
Lj959:
	cmpw	$2047,_U_$P$PL0_$$_NUM(%rip)
	jg	Lj962
	jmp	Lj963
Lj962:
	movl	$30,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
	movw	$0,_U_$P$PL0_$$_NUM(%rip)
Lj963:
	movw	_U_$P$PL0_$$_NUM(%rip),%ax
	movw	%ax,16(%rbx)
	jmp	Lj957
Lj960:
	movq	-16(%rbp),%rax
	movw	-8(%rax),%ax
	movw	%ax,16(%rbx)
	movq	-16(%rbp),%rax
	movw	-28(%rax),%ax
	movw	%ax,18(%rbx)
	movq	-16(%rbp),%rax
	movswl	-28(%rax),%eax
	leal	1(%eax),%eax
	movq	-16(%rbp),%rdx
	movw	%ax,-28(%rdx)
	jmp	Lj957
Lj961:
	movq	-16(%rbp),%rax
	movw	-8(%rax),%ax
	movw	%ax,16(%rbx)
	jmp	Lj957
Lj958:
Lj957:
	movq	-24(%rbp),%rbx
	leave
	ret

.text
	.align 3
.globl	_P$PL0_$$_INTERPRET
_P$PL0_$$_INTERPRET:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-1040(%rsp),%rsp
	movq	%rbx,-1032(%rbp)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$PL0$_Ld5@GOTPCREL(%rip),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
	movw	$0,-12(%rbp)
	movw	$1,-8(%rbp)
	movw	$0,-4(%rbp)
	movw	$0,-1020(%rbp)
	movw	$0,-1018(%rbp)
	movw	$0,-1016(%rbp)
	.align 2
Lj1004:
	movzwl	-4(%rbp),%eax
	imulq	$7,%rax,%rdx
	leaq	_U_$P$PL0_$$_CODE(%rip),%rax
	movl	(%rax,%rdx),%eax
	movl	%eax,-20(%rbp)
	leaq	_U_$P$PL0_$$_CODE(%rip),%rax
	movw	4(%rax,%rdx),%ax
	movw	%ax,-16(%rbp)
	leaq	_U_$P$PL0_$$_CODE(%rip),%rax
	movb	6(%rax,%rdx),%al
	movb	%al,-14(%rbp)
	movswl	-4(%rbp),%eax
	leal	1(%eax),%eax
	movw	%ax,-4(%rbp)
	movl	-20(%rbp),%eax
	testl	%eax,%eax
	je	Lj1013
	subl	$1,%eax
	je	Lj1014
	subl	$1,%eax
	je	Lj1015
	subl	$1,%eax
	je	Lj1016
	subl	$1,%eax
	je	Lj1017
	subl	$1,%eax
	je	Lj1018
	subl	$1,%eax
	je	Lj1019
	subl	$1,%eax
	je	Lj1020
	jmp	Lj1012
Lj1013:
	movswl	-12(%rbp),%eax
	leal	1(%eax),%eax
	movw	%ax,-12(%rbp)
	movzwl	-12(%rbp),%edx
	movw	-15(%rbp),%ax
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1011
Lj1014:
	movw	-15(%rbp),%ax
	testw	%ax,%ax
	je	Lj1027
	subw	$1,%ax
	je	Lj1028
	subw	$1,%ax
	je	Lj1029
	subw	$1,%ax
	je	Lj1030
	subw	$1,%ax
	je	Lj1031
	subw	$1,%ax
	je	Lj1032
	subw	$1,%ax
	je	Lj1033
	subw	$2,%ax
	je	Lj1034
	subw	$1,%ax
	je	Lj1035
	subw	$1,%ax
	je	Lj1036
	subw	$1,%ax
	je	Lj1037
	subw	$1,%ax
	je	Lj1038
	subw	$1,%ax
	je	Lj1039
	jmp	Lj1026
Lj1027:
	movswl	-8(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	movswq	-12(%rbp),%rax
	leaq	3(%rax),%rax
	movw	-1022(%rbp,%rax,2),%ax
	movw	%ax,-4(%rbp)
	movswq	-12(%rbp),%rax
	leaq	2(%rax),%rax
	movw	-1022(%rbp,%rax,2),%ax
	movw	%ax,-8(%rbp)
	jmp	Lj1025
Lj1028:
	movzwl	-12(%rbp),%eax
	movswq	-1022(%rbp,%rax,2),%rax
	negq	%rax
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1029:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	movswq	-12(%rbp),%rax
	leaq	1(%rax),%rax
	movswl	-1022(%rbp,%rax,2),%edx
	movzwl	-12(%rbp),%eax
	movswl	-1022(%rbp,%rax,2),%eax
	leal	(%edx,%eax),%eax
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1030:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	movswq	-12(%rbp),%rax
	leaq	1(%rax),%rax
	movswl	-1022(%rbp,%rax,2),%edx
	movzwl	-12(%rbp),%eax
	movswl	-1022(%rbp,%rax,2),%eax
	subl	%edx,%eax
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1031:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	movswq	-12(%rbp),%rax
	leaq	1(%rax),%rax
	movswl	-1022(%rbp,%rax,2),%edx
	movzwl	-12(%rbp),%eax
	movswl	-1022(%rbp,%rax,2),%eax
	imull	%edx,%eax
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1032:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	movzwl	-12(%rbp),%eax
	movswq	-1022(%rbp,%rax,2),%rax
	movswq	-12(%rbp),%rdx
	leaq	1(%rdx),%rdx
	movswq	-1022(%rbp,%rdx,2),%rcx
	cqto
	idivq	%rcx
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1033:
	movzwl	-12(%rbp),%eax
	movswl	-1022(%rbp,%rax,2),%eax
	movl	%eax,-1024(%rbp)
	movl	-1024(%rbp),%eax
	andl	$1,%eax
	movzbw	%al,%ax
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1034:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	movswq	-12(%rbp),%rax
	leaq	1(%rax),%rax
	movzwl	-12(%rbp),%edx
	movw	-1022(%rbp,%rax,2),%ax
	cmpw	-1022(%rbp,%rdx,2),%ax
	seteb	%al
	movzbw	%al,%ax
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1035:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	movswq	-12(%rbp),%rax
	leaq	1(%rax),%rax
	movzwl	-12(%rbp),%edx
	movw	-1022(%rbp,%rax,2),%ax
	cmpw	-1022(%rbp,%rdx,2),%ax
	setneb	%al
	movzbw	%al,%ax
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1036:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	movswq	-12(%rbp),%rax
	leaq	1(%rax),%rax
	movzwl	-12(%rbp),%edx
	movw	-1022(%rbp,%rax,2),%ax
	cmpw	-1022(%rbp,%rdx,2),%ax
	setgb	%al
	movzbw	%al,%ax
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1037:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	movswq	-12(%rbp),%rax
	leaq	1(%rax),%rax
	movzwl	-12(%rbp),%edx
	movw	-1022(%rbp,%rax,2),%ax
	cmpw	-1022(%rbp,%rdx,2),%ax
	setleb	%al
	movzbw	%al,%ax
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1038:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	movswq	-12(%rbp),%rax
	leaq	1(%rax),%rax
	movzwl	-12(%rbp),%edx
	movw	-1022(%rbp,%rax,2),%ax
	cmpw	-1022(%rbp,%rdx,2),%ax
	setlb	%al
	movzbw	%al,%ax
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1039:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	movswq	-12(%rbp),%rax
	leaq	1(%rax),%rax
	movzwl	-12(%rbp),%edx
	movw	-1022(%rbp,%rax,2),%ax
	cmpw	-1022(%rbp,%rdx,2),%ax
	setgeb	%al
	movzbw	%al,%ax
	movzwl	-12(%rbp),%edx
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1025
Lj1026:
Lj1025:
	jmp	Lj1011
Lj1015:
	movswl	-12(%rbp),%eax
	leal	1(%eax),%eax
	movw	%ax,-12(%rbp)
	movzbw	-16(%rbp),%si
	movswl	%si,%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$INTERPRET_$$_BASE$SMALLINT$$SMALLINT
	movswq	%ax,%rax
	movzwl	-15(%rbp),%edx
	leaq	(%rax,%rdx),%rax
	movzwl	-12(%rbp),%edx
	movw	-1022(%rbp,%rax,2),%ax
	movw	%ax,-1022(%rbp,%rdx,2)
	jmp	Lj1011
Lj1016:
	movzbw	-16(%rbp),%si
	movswl	%si,%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$INTERPRET_$$_BASE$SMALLINT$$SMALLINT
	movswq	%ax,%rax
	movzwl	-15(%rbp),%edx
	leaq	(%rax,%rdx),%rdx
	movzwl	-12(%rbp),%eax
	movw	-1022(%rbp,%rax,2),%ax
	movw	%ax,-1022(%rbp,%rdx,2)
	call	fpc_get_output
	movq	%rax,%rbx
	movzwl	-12(%rbp),%eax
	movswq	-1022(%rbp,%rax,2),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	jmp	Lj1011
Lj1017:
	movzbw	-16(%rbp),%si
	movswl	%si,%esi
	movq	%rbp,%rdi
	call	_P$PL0$_$INTERPRET_$$_BASE$SMALLINT$$SMALLINT
	movswq	-12(%rbp),%rdx
	leaq	1(%rdx),%rdx
	movw	%ax,-1022(%rbp,%rdx,2)
	movswq	-12(%rbp),%rax
	leaq	2(%rax),%rdx
	movw	-8(%rbp),%ax
	movw	%ax,-1022(%rbp,%rdx,2)
	movswq	-12(%rbp),%rax
	leaq	3(%rax),%rax
	movw	-4(%rbp),%dx
	movw	%dx,-1022(%rbp,%rax,2)
	movswl	-12(%rbp),%eax
	leal	1(%eax),%eax
	movw	%ax,-8(%rbp)
	movw	-15(%rbp),%ax
	movw	%ax,-4(%rbp)
	jmp	Lj1011
Lj1018:
	movzwl	-15(%rbp),%eax
	movswl	-12(%rbp),%edx
	leal	(%eax,%edx),%eax
	movw	%ax,-12(%rbp)
	jmp	Lj1011
Lj1019:
	movw	-15(%rbp),%ax
	movw	%ax,-4(%rbp)
	jmp	Lj1011
Lj1020:
	movzwl	-12(%rbp),%eax
	cmpw	$0,-1022(%rbp,%rax,2)
	je	Lj1154
	jmp	Lj1155
Lj1154:
	movw	-15(%rbp),%ax
	movw	%ax,-4(%rbp)
Lj1155:
	movswl	-12(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-12(%rbp)
	jmp	Lj1011
Lj1012:
Lj1011:
	cmpw	$0,-4(%rbp)
	je	Lj1006
	jmp	Lj1004
Lj1006:
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$PL0$_Ld6@GOTPCREL(%rip),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_write_end
	call	FPC_IOCHECK
	movq	-1032(%rbp),%rbx
	leave
	ret

.text
	.align 3
.globl	_P$PL0$_$INTERPRET_$$_BASE$SMALLINT$$SMALLINT
_P$PL0$_$INTERPRET_$$_BASE$SMALLINT$$SMALLINT:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-32(%rsp),%rsp
	movq	%rdi,-16(%rbp)
	movw	%si,-8(%rbp)
	movq	-16(%rbp),%rax
	movw	-8(%rax),%ax
	movw	%ax,-24(%rbp)
	jmp	Lj1173
	.align 2
Lj1172:
	movq	-16(%rbp),%rdx
	movzwl	-24(%rbp),%eax
	movw	-1022(%rdx,%rax,2),%ax
	movw	%ax,-24(%rbp)
	movswl	-8(%rbp),%eax
	leal	-1(%eax),%eax
	movw	%ax,-8(%rbp)
Lj1173:
	cmpw	$0,-8(%rbp)
	jg	Lj1172
	jmp	Lj1174
Lj1174:
	movw	-24(%rbp),%ax
	movw	%ax,-20(%rbp)
	movswl	-20(%rbp),%eax
	leave
	ret

.text
	.align 3
.globl	_PASCALMAIN
_PASCALMAIN:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-16(%rsp),%rsp
	movq	%rbx,-8(%rbp)
	call	FPC_INITIALIZEUNITS
	movq	_$PL0$_Ld7@GOTPCREL(%rip),%rax
	movq	(%rax),%rax
	movq	%rax,_U_$P$PL0_$$_WORD(%rip)
	movq	_$PL0$_Ld7@GOTPCREL(%rip),%rax
	movw	8(%rax),%ax
	movw	%ax,_U_$P$PL0_$$_WORD+8(%rip)
	movq	_$PL0$_Ld8@GOTPCREL(%rip),%rax
	movq	(%rax),%rax
	movq	%rax,_U_$P$PL0_$$_WORD+10(%rip)
	movq	_$PL0$_Ld8@GOTPCREL(%rip),%rax
	movw	8(%rax),%ax
	movw	%ax,_U_$P$PL0_$$_WORD+18(%rip)
	movq	_$PL0$_Ld9@GOTPCREL(%rip),%rax
	movq	(%rax),%rax
	movq	%rax,_U_$P$PL0_$$_WORD+20(%rip)
	movq	_$PL0$_Ld9@GOTPCREL(%rip),%rax
	movw	8(%rax),%ax
	movw	%ax,_U_$P$PL0_$$_WORD+28(%rip)
	movq	_$PL0$_Ld10@GOTPCREL(%rip),%rax
	movq	(%rax),%rax
	movq	%rax,_U_$P$PL0_$$_WORD+30(%rip)
	movq	_$PL0$_Ld10@GOTPCREL(%rip),%rax
	movw	8(%rax),%ax
	movw	%ax,_U_$P$PL0_$$_WORD+38(%rip)
	movq	_$PL0$_Ld11@GOTPCREL(%rip),%rax
	movq	(%rax),%rax
	movq	%rax,_U_$P$PL0_$$_WORD+40(%rip)
	movq	_$PL0$_Ld11@GOTPCREL(%rip),%rax
	movw	8(%rax),%ax
	movw	%ax,_U_$P$PL0_$$_WORD+48(%rip)
	movq	_$PL0$_Ld12@GOTPCREL(%rip),%rax
	movq	(%rax),%rax
	movq	%rax,_U_$P$PL0_$$_WORD+50(%rip)
	movq	_$PL0$_Ld12@GOTPCREL(%rip),%rax
	movw	8(%rax),%ax
	movw	%ax,_U_$P$PL0_$$_WORD+58(%rip)
	movq	_$PL0$_Ld13@GOTPCREL(%rip),%rax
	movq	(%rax),%rax
	movq	%rax,_U_$P$PL0_$$_WORD+60(%rip)
	movq	_$PL0$_Ld13@GOTPCREL(%rip),%rax
	movw	8(%rax),%ax
	movw	%ax,_U_$P$PL0_$$_WORD+68(%rip)
	movq	_$PL0$_Ld14@GOTPCREL(%rip),%rax
	movq	(%rax),%rax
	movq	%rax,_U_$P$PL0_$$_WORD+70(%rip)
	movq	_$PL0$_Ld14@GOTPCREL(%rip),%rax
	movw	8(%rax),%ax
	movw	%ax,_U_$P$PL0_$$_WORD+78(%rip)
	movq	_$PL0$_Ld15@GOTPCREL(%rip),%rax
	movq	(%rax),%rax
	movq	%rax,_U_$P$PL0_$$_WORD+80(%rip)
	movq	_$PL0$_Ld15@GOTPCREL(%rip),%rax
	movw	8(%rax),%ax
	movw	%ax,_U_$P$PL0_$$_WORD+88(%rip)
	movq	_$PL0$_Ld16@GOTPCREL(%rip),%rax
	movq	(%rax),%rax
	movq	%rax,_U_$P$PL0_$$_WORD+90(%rip)
	movq	_$PL0$_Ld16@GOTPCREL(%rip),%rax
	movw	8(%rax),%ax
	movw	%ax,_U_$P$PL0_$$_WORD+98(%rip)
	movq	_$PL0$_Ld17@GOTPCREL(%rip),%rax
	movq	(%rax),%rax
	movq	%rax,_U_$P$PL0_$$_WORD+100(%rip)
	movq	_$PL0$_Ld17@GOTPCREL(%rip),%rax
	movw	8(%rax),%ax
	movw	%ax,_U_$P$PL0_$$_WORD+108(%rip)
	movl	$20,_U_$P$PL0_$$_WSYM(%rip)
	movl	$26,_U_$P$PL0_$$_WSYM+4(%rip)
	movl	$27,_U_$P$PL0_$$_WSYM+8(%rip)
	movl	$25,_U_$P$PL0_$$_WSYM+12(%rip)
	movl	$21,_U_$P$PL0_$$_WSYM+16(%rip)
	movl	$22,_U_$P$PL0_$$_WSYM+20(%rip)
	movl	$7,_U_$P$PL0_$$_WSYM+24(%rip)
	movl	$29,_U_$P$PL0_$$_WSYM+28(%rip)
	movl	$23,_U_$P$PL0_$$_WSYM+32(%rip)
	movl	$28,_U_$P$PL0_$$_WSYM+36(%rip)
	movl	$24,_U_$P$PL0_$$_WSYM+40(%rip)
	movl	$3,_U_$P$PL0_$$_SSYM+172(%rip)
	movl	$4,_U_$P$PL0_$$_SSYM+180(%rip)
	movl	$5,_U_$P$PL0_$$_SSYM+168(%rip)
	movl	$6,_U_$P$PL0_$$_SSYM+188(%rip)
	movl	$14,_U_$P$PL0_$$_SSYM+160(%rip)
	movl	$15,_U_$P$PL0_$$_SSYM+164(%rip)
	movl	$8,_U_$P$PL0_$$_SSYM+244(%rip)
	movl	$16,_U_$P$PL0_$$_SSYM+176(%rip)
	movl	$18,_U_$P$PL0_$$_SSYM+184(%rip)
	movl	$9,_U_$P$PL0_$$_SSYM+504(%rip)
	movl	$10,_U_$P$PL0_$$_SSYM+240(%rip)
	movl	$12,_U_$P$PL0_$$_SSYM+248(%rip)
	movl	$11,_U_$P$PL0_$$_SSYM+144(%rip)
	movl	$13,_U_$P$PL0_$$_SSYM+376(%rip)
	movl	$17,_U_$P$PL0_$$_SSYM+236(%rip)
	movq	_$PL0$_Ld18@GOTPCREL(%rip),%rax
	movl	(%rax),%eax
	movl	%eax,_U_$P$PL0_$$_MNEMONIC(%rip)
	movq	_$PL0$_Ld18@GOTPCREL(%rip),%rax
	movb	4(%rax),%al
	movb	%al,_U_$P$PL0_$$_MNEMONIC+4(%rip)
	movq	_$PL0$_Ld19@GOTPCREL(%rip),%rax
	movl	(%rax),%eax
	movl	%eax,_U_$P$PL0_$$_MNEMONIC+5(%rip)
	movq	_$PL0$_Ld19@GOTPCREL(%rip),%rax
	movb	4(%rax),%al
	movb	%al,_U_$P$PL0_$$_MNEMONIC+9(%rip)
	movq	_$PL0$_Ld20@GOTPCREL(%rip),%rax
	movl	(%rax),%eax
	movl	%eax,_U_$P$PL0_$$_MNEMONIC+10(%rip)
	movq	_$PL0$_Ld20@GOTPCREL(%rip),%rax
	movb	4(%rax),%al
	movb	%al,_U_$P$PL0_$$_MNEMONIC+14(%rip)
	movq	_$PL0$_Ld21@GOTPCREL(%rip),%rax
	movl	(%rax),%eax
	movl	%eax,_U_$P$PL0_$$_MNEMONIC+15(%rip)
	movq	_$PL0$_Ld21@GOTPCREL(%rip),%rax
	movb	4(%rax),%al
	movb	%al,_U_$P$PL0_$$_MNEMONIC+19(%rip)
	movq	_$PL0$_Ld22@GOTPCREL(%rip),%rax
	movl	(%rax),%eax
	movl	%eax,_U_$P$PL0_$$_MNEMONIC+20(%rip)
	movq	_$PL0$_Ld22@GOTPCREL(%rip),%rax
	movb	4(%rax),%al
	movb	%al,_U_$P$PL0_$$_MNEMONIC+24(%rip)
	movq	_$PL0$_Ld23@GOTPCREL(%rip),%rax
	movl	(%rax),%eax
	movl	%eax,_U_$P$PL0_$$_MNEMONIC+25(%rip)
	movq	_$PL0$_Ld23@GOTPCREL(%rip),%rax
	movb	4(%rax),%al
	movb	%al,_U_$P$PL0_$$_MNEMONIC+29(%rip)
	movq	_$PL0$_Ld24@GOTPCREL(%rip),%rax
	movl	(%rax),%eax
	movl	%eax,_U_$P$PL0_$$_MNEMONIC+30(%rip)
	movq	_$PL0$_Ld24@GOTPCREL(%rip),%rax
	movb	4(%rax),%al
	movb	%al,_U_$P$PL0_$$_MNEMONIC+34(%rip)
	movq	_$PL0$_Ld25@GOTPCREL(%rip),%rax
	movl	(%rax),%eax
	movl	%eax,_U_$P$PL0_$$_MNEMONIC+35(%rip)
	movq	_$PL0$_Ld25@GOTPCREL(%rip),%rax
	movb	4(%rax),%al
	movb	%al,_U_$P$PL0_$$_MNEMONIC+39(%rip)
	movl	$939524096,_U_$P$PL0_$$_DECLBEGSYS(%rip)
	movl	$89128960,_U_$P$PL0_$$_STATBEGSYS(%rip)
	movl	$16390,_U_$P$PL0_$$_FACBEGSYS(%rip)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$PL0$_Ld26@GOTPCREL(%rip),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_write_end
	call	FPC_IOCHECK
	call	fpc_get_input
	movq	%rax,%rbx
	leaq	_U_$P$PL0_$$_SRCFILENAME(%rip),%rsi
	movq	%rbx,%rdi
	movq	$255,%rdx
	call	fpc_read_text_shortstr
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_readln_end
	call	FPC_IOCHECK
	movq	_$PL0$_Ld27@GOTPCREL(%rip),%rdx
	leaq	_U_$P$PL0_$$_OUTFILENAME(%rip),%rdi
	movq	$255,%rsi
	call	fpc_shortstr_to_shortstr
	movq	_$PL0$_Ld28@GOTPCREL(%rip),%rdx
	leaq	_U_$P$PL0_$$_ITMDFILENAME(%rip),%rdi
	movq	$255,%rsi
	call	fpc_shortstr_to_shortstr
	movq	_$PL0$_Ld29@GOTPCREL(%rip),%rdx
	leaq	_U_$P$PL0_$$_RESFILENAME(%rip),%rdi
	movq	$255,%rsi
	call	fpc_shortstr_to_shortstr
	leaq	_U_$P$PL0_$$_SRCFILENAME(%rip),%rsi
	leaq	_U_$P$PL0_$$_FIN(%rip),%rdi
	call	_SYSTEM_$$_ASSIGN$TEXT$SHORTSTRING
	leaq	_U_$P$PL0_$$_OUTFILENAME(%rip),%rsi
	leaq	_U_$P$PL0_$$_FOUT(%rip),%rdi
	call	_SYSTEM_$$_ASSIGN$TEXT$SHORTSTRING
	leaq	_U_$P$PL0_$$_ITMDFILENAME(%rip),%rsi
	leaq	_U_$P$PL0_$$_FITMD(%rip),%rdi
	call	_SYSTEM_$$_ASSIGN$TEXT$SHORTSTRING
	leaq	_U_$P$PL0_$$_RESFILENAME(%rip),%rsi
	leaq	_U_$P$PL0_$$_FRES(%rip),%rdi
	call	_SYSTEM_$$_ASSIGN$TEXT$SHORTSTRING
	leaq	_U_$P$PL0_$$_FOUT(%rip),%rdi
	call	_SYSTEM_$$_REWRITE$TEXT
	call	FPC_IOCHECK
	leaq	_U_$P$PL0_$$_FITMD(%rip),%rdi
	call	_SYSTEM_$$_REWRITE$TEXT
	call	FPC_IOCHECK
	leaq	_U_$P$PL0_$$_FRES(%rip),%rdi
	call	_SYSTEM_$$_REWRITE$TEXT
	call	FPC_IOCHECK
	leaq	_U_$P$PL0_$$_FIN(%rip),%rdi
	call	_SYSTEM_$$_RESET$TEXT
	call	FPC_IOCHECK
	movw	$0,_U_$P$PL0_$$_ERR(%rip)
	movw	$0,_U_$P$PL0_$$_CC(%rip)
	movw	$0,_U_$P$PL0_$$_CX(%rip)
	movw	$0,_U_$P$PL0_$$_LL(%rip)
	movb	$32,_U_$P$PL0_$$_CH(%rip)
	movw	$10,_U_$P$PL0_$$_KK(%rip)
	call	_P$PL0_$$_GETSYM
	movl	$262144,%edx
	orl	_U_$P$PL0_$$_DECLBEGSYS(%rip),%edx
	orl	_U_$P$PL0_$$_STATBEGSYS(%rip),%edx
	movl	$0,%esi
	movl	$0,%edi
	call	_P$PL0_$$_BLOCK$SMALLINT$SMALLINT$SYMSET
	cmpl	$18,_U_$P$PL0_$$_SYM(%rip)
	jne	Lj1357
	jmp	Lj1358
Lj1357:
	movl	$9,%edi
	call	_P$PL0_$$_ERROR$SMALLINT
Lj1358:
	cmpw	$0,_U_$P$PL0_$$_ERR(%rip)
	je	Lj1361
	jmp	Lj1362
Lj1361:
	call	_P$PL0_$$_INTERPRET
	jmp	Lj1363
Lj1362:
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$PL0$_Ld30@GOTPCREL(%rip),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_write_end
	call	FPC_IOCHECK
Lj1363:
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
	call	FPC_DO_EXIT
	movq	-8(%rbp),%rbx
	leave
	ret

.text
	.align 2
.globl	_main
_main:
	jmp	_FPC_SYSTEMMAIN
# End asmlist al_procedures
# Begin asmlist al_globals


	.lcomm	_U_$P$PL0_$$_CH,1,1


	.align 2
	.lcomm	_U_$P$PL0_$$_SYM,4,2


	.lcomm	_U_$P$PL0_$$_ID,10,1


	.align 1
	.lcomm	_U_$P$PL0_$$_NUM,2,1


	.align 1
	.lcomm	_U_$P$PL0_$$_CC,2,1


	.align 1
	.lcomm	_U_$P$PL0_$$_LL,2,1


	.align 1
	.lcomm	_U_$P$PL0_$$_KK,2,1


	.align 1
	.lcomm	_U_$P$PL0_$$_ERR,2,1


	.align 1
	.lcomm	_U_$P$PL0_$$_CX,2,1


	.lcomm	_U_$P$PL0_$$_LINE,81,1


	.lcomm	_U_$P$PL0_$$_A,10,1


	.align 2
	.lcomm	_U_$P$PL0_$$_CODE,1407,2


	.lcomm	_U_$P$PL0_$$_WORD,110,1


	.align 2
	.lcomm	_U_$P$PL0_$$_WSYM,44,2


	.align 2
	.lcomm	_U_$P$PL0_$$_SSYM,1024,2


	.lcomm	_U_$P$PL0_$$_MNEMONIC,40,1


	.align 2
	.lcomm	_U_$P$PL0_$$_DECLBEGSYS,4,2


	.align 2
	.lcomm	_U_$P$PL0_$$_STATBEGSYS,4,2


	.align 2
	.lcomm	_U_$P$PL0_$$_FACBEGSYS,4,2


	.lcomm	_U_$P$PL0_$$_SRCFILENAME,256,1


	.lcomm	_U_$P$PL0_$$_OUTFILENAME,256,1


	.lcomm	_U_$P$PL0_$$_ITMDFILENAME,256,1


	.lcomm	_U_$P$PL0_$$_RESFILENAME,256,1


	.align 4
	.lcomm	_U_$P$PL0_$$_FIN,888,4


	.align 4
	.lcomm	_U_$P$PL0_$$_FOUT,888,4


	.align 4
	.lcomm	_U_$P$PL0_$$_FITMD,888,4


	.align 4
	.lcomm	_U_$P$PL0_$$_FRES,888,4


	.align 2
	.lcomm	_U_$P$PL0_$$_TABLE,2020,2

.data
	.align 3
.globl	INITFINAL
INITFINAL:
	.quad	1,0
	.quad	_INIT$_$SYSTEM
	.quad	0

.data
	.align 3
.globl	FPC_THREADVARTABLES
FPC_THREADVARTABLES:
	.long	1
	.quad	_THREADVARLIST_$SYSTEM

.data
	.align 3
.globl	FPC_RESOURCESTRINGTABLES
FPC_RESOURCESTRINGTABLES:
	.quad	0

.data
	.align 3
.globl	FPC_WIDEINITTABLES
FPC_WIDEINITTABLES:
	.quad	0

.data
	.align 3
.globl	FPC_RESSTRINITTABLES
FPC_RESSTRINITTABLES:
	.quad	0

.section __TEXT, .fpc, regular, no_dead_strip
	.align 3
	.ascii	"FPC 3.0.4 [2017/11/26] for x86_64 - Darwin"

.data
	.align 3
.globl	__stklen
__stklen:
	.quad	262144

.data
	.align 3
.globl	__heapsize
__heapsize:
	.quad	0

.data
.globl	__fpc_valgrind
__fpc_valgrind:
	.byte	0

.data
	.align 3
.globl	FPC_RESLOCATION
FPC_RESLOCATION:
	.quad	0
# End asmlist al_globals
# Begin asmlist al_typedconsts

.const
	.align 3
.globl	_$PL0$_Ld1
_$PL0$_Ld1:
	.ascii	"\004****\000"

.const
	.align 3
.globl	_$PL0$_Ld2
_$PL0$_Ld2:
	.ascii	"\003\342\206\221\000"

.const
	.align 3
.globl	_$PL0$_Ld3
_$PL0$_Ld3:
	.ascii	"\022PROGRAM INCOMPLETE\000"

.const
	.align 3
.globl	_$PL0$_Ld4
_$PL0$_Ld4:
	.ascii	"\020PROGRAM TOO LONG\000"

.const
	.align 3
.globl	_$PL0$_Ld5
_$PL0$_Ld5:
	.ascii	"\012START PL/0\000"

.const
	.align 3
.globl	_$PL0$_Ld6
_$PL0$_Ld6:
	.ascii	"\010END PL/0\000"

.const
	.align 3
.globl	_$PL0$_Ld7
_$PL0$_Ld7:
	.ascii	"BEGIN     \000"

.const
	.align 3
.globl	_$PL0$_Ld8
_$PL0$_Ld8:
	.ascii	"CALL      \000"

.const
	.align 3
.globl	_$PL0$_Ld9
_$PL0$_Ld9:
	.ascii	"CONST     \000"

.const
	.align 3
.globl	_$PL0$_Ld10
_$PL0$_Ld10:
	.ascii	"DO        \000"

.const
	.align 3
.globl	_$PL0$_Ld11
_$PL0$_Ld11:
	.ascii	"END       \000"

.const
	.align 3
.globl	_$PL0$_Ld12
_$PL0$_Ld12:
	.ascii	"IF        \000"

.const
	.align 3
.globl	_$PL0$_Ld13
_$PL0$_Ld13:
	.ascii	"ODD       \000"

.const
	.align 3
.globl	_$PL0$_Ld14
_$PL0$_Ld14:
	.ascii	"PROCEDURE \000"

.const
	.align 3
.globl	_$PL0$_Ld15
_$PL0$_Ld15:
	.ascii	"THEN      \000"

.const
	.align 3
.globl	_$PL0$_Ld16
_$PL0$_Ld16:
	.ascii	"VAR       \000"

.const
	.align 3
.globl	_$PL0$_Ld17
_$PL0$_Ld17:
	.ascii	"WHILE     \000"

.const
	.align 3
.globl	_$PL0$_Ld18
_$PL0$_Ld18:
	.ascii	"LIT\000\000\000"

.const
	.align 3
.globl	_$PL0$_Ld19
_$PL0$_Ld19:
	.ascii	"OPR\000\000\000"

.const
	.align 3
.globl	_$PL0$_Ld20
_$PL0$_Ld20:
	.ascii	"LOD\000\000\000"

.const
	.align 3
.globl	_$PL0$_Ld21
_$PL0$_Ld21:
	.ascii	"STO\000\000\000"

.const
	.align 3
.globl	_$PL0$_Ld22
_$PL0$_Ld22:
	.ascii	"CAL\000\000\000"

.const
	.align 3
.globl	_$PL0$_Ld23
_$PL0$_Ld23:
	.ascii	"INT\000\000\000"

.const
	.align 3
.globl	_$PL0$_Ld24
_$PL0$_Ld24:
	.ascii	"JMP\000\000\000"

.const
	.align 3
.globl	_$PL0$_Ld25
_$PL0$_Ld25:
	.ascii	"JPC\000\000\000"

.const
	.align 3
.globl	_$PL0$_Ld26
_$PL0$_Ld26:
	.ascii	"\015Source File: \000"

.const
	.align 3
.globl	_$PL0$_Ld27
_$PL0$_Ld27:
	.ascii	"\007out.txt\000"

.const
	.align 3
.globl	_$PL0$_Ld28
_$PL0$_Ld28:
	.ascii	"\020intermediate.txt\000"

.const
	.align 3
.globl	_$PL0$_Ld29
_$PL0$_Ld29:
	.ascii	"\012result.txt\000"

.const
	.align 3
.globl	_$PL0$_Ld30
_$PL0$_Ld30:
	.ascii	"\026ERRORS IN PL/0 PROGRAM\000"
# End asmlist al_typedconsts
	.subsections_via_symbols

