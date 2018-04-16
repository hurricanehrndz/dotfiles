set nocompatible

syntax on
filetype plugin on
set background=dark

set runtimepath=~/.vim/min,$VIMRUNTIME,~/.vim/min/after
let &packpath = &runtimepath

" Try to load minpac (async plugin manager).
set loadplugins
silent! packadd minpac

if exists('*minpac#init')
    " minpac is available.
    call minpac#init()
endif

let g:python_host_prog = '/home/hurricanehrndz/.virtualenvs/neovim2/bin/python'
let g:python3_host_prog = '/home/hurricanehrndz/.virtualenvs/neovim3/bin/python'

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackList echo join(minpac#getpackages("minpac", "start"), "\n")
