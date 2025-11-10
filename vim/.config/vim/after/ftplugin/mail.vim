setlocal spell

" Vim ships with a mail filetype plugin which already does this, but since I
" `set textwidth=80` in my vimrc, I need to repeat it.
if &textwidth != 72
  setlocal textwidth=72
endif
