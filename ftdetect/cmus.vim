augroup cmus_filetype
  autocmd!
  autocmd BufRead,BufNewFile */cmus/rc,*/cmus/*.conf,*/cmus/*.theme setlocal filetype=cmus
augroup END
