
/*notice:you have only  three places need to change for adding a system call in the linux0.11 source code*/

/*1.please replace the following code with the relative content in the system_call.s in the linux0.11 source code */

_system_call:
/**
	cmpl $nr_system_calls-1,%eax
	ja bad_sys_call
**/	
	push %ds
	push %es
	push %fs
	pushl %edx
	pushl %ecx		# push %ebx,%ecx,%edx as parameters
	pushl %ebx		# to the system call

  /*for test added by jeff*/
	push %ax
	push %bx
	push %dx
	mov %cs,%ax
	mov %ds,%bx
	mov %ss,%dx
	

	
	movl $0x10,%edx		# set up ds,es to kernel space
	mov %dx,%ds
	mov %dx,%es


  /*for test added by jeff*/
	mov %ax,_afcs
	mov %bx,_afds
	mov %dx,_afss
	pop %dx
	pop %bx
	pop %ax

/*2.please replace the following code with the relative content which in the include/linux/sys.h in the linux0.11 source code*/
extern int sys_newcall();

fn_ptr sys_call_table[] = { sys_setup, sys_exit, sys_fork, sys_read,
sys_write, sys_open, sys_close, sys_waitpid, sys_creat, sys_link,
sys_unlink, sys_execve, sys_chdir, sys_time, sys_mknod, sys_chmod,
sys_chown, sys_break, sys_stat, sys_lseek, sys_getpid, sys_mount,
sys_umount, sys_setuid, sys_getuid, sys_stime, sys_ptrace, sys_alarm,
sys_fstat, sys_pause, sys_utime, sys_stty, sys_gtty, sys_access,
sys_nice, sys_ftime, sys_sync, sys_kill, sys_rename, sys_mkdir,
sys_rmdir, sys_dup, sys_pipe, sys_times, sys_prof, sys_brk, sys_setgid,
sys_getgid, sys_signal, sys_geteuid, sys_getegid, sys_acct, sys_phys,
sys_lock, sys_ioctl, sys_fcntl, sys_mpx, sys_setpgid, sys_ulimit,
sys_uname, sys_umask, sys_chroot, sys_ustat, sys_dup2, sys_getppid,
sys_getpgrp, sys_setsid, sys_sigaction, sys_sgetmask, sys_ssetmask,
sys_setreuid,sys_setregid, sys_sigsuspend, sys_sigpending, sys_sethostname,
sys_setrlimit, sys_getrlimit, sys_getrusage, sys_gettimeofday, 
sys_settimeofday, sys_getgroups, sys_setgroups, sys_select, sys_symlink,
sys_lstat, sys_readlink, sys_uselib,sys_newcall };


/*3.please add following code to kernel/sys.c in the linux0.11 source code*/
int afcs;
int afds;
int afss;
int sys_newcall()
{
	printk("kernel space: afcs =0x%x afds =0x%x afss=0x%x\n",afcs,afds,afss);
	return 9;
}

		/*the end! by jeff*/
