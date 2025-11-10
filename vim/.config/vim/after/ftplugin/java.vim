abbreviate <buffer> sysout System.out.println( );2<Left>s
abbreviate <buffer> syserr System.err.println( );2<Left>s
abbreviate <buffer> psvm public static void main(String[] args) {}
abbreviate <buffer> brdr BufferedReader

setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
if has('folding')
  setlocal foldnestmax=5  " At this point, just refactor
endif
