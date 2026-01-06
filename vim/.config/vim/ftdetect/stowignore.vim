" stow supports ignore lists, much like git does
autocmd BufRead,BufNewFile *.stow-local-ignore,*.stow-global-ignore
      \ setfiletype gitignore
