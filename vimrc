" An example for a vimrc file.
" 
"  Maintainer: Bram Moolenaar <Bram@vim.org>
"  Last change:  2002 Sep 19
" 
"  To use it, copy it to
"         for Unix and OS/2:  ~/.vimrc
"                 for Amiga:  s:.vimrc
"      for MS-DOS and Win32:  $VIM\_vimrc
"               for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" To enable backup and undofile remove "
"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file (restore to previous version)
"  set undofile		" keep an undo file (undo changes after closing)
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set t_Co=256
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set all files without type as .sh
  au BufNewFile,BufRead * if &ft == "" | set ft=sh | endif

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif



"======================================================================
" This is the second part of this file that I customized for my flavors
" 
" @author: Francesco Di Nardo (francdin@gmail.com)
" @date:   25 september 2015
"
"======================================================================

"====================== Personal customizations =======================

set bg=dark                       "Set the background style to dark
set number                        "Line numbers are good :)
set ignorecase                    "Ignore case when searching
set backspace=indent,eol,start    "Allow backspace ininsert mode
set sta
set autoread                      "Reload files changed outside vim
set laststatus=2                  "Show the file name at the bottom
set mouse=a                       "Enable to using mouse in vim
set expandtab                     "Insert spaces char instead of tab
set tabstop=2                     "Number of space of tab
set shiftwidth=2                  "Number of space for autondent with tab
set smartindent                   "Smart Indent
set cindent                       "cindent
set showmatch                     "Show matching brackets when text indicator is over them
set mat=2                         "How many thents of sec to blink when matching brackets
set encoding=utf8                 "Set utf8 as standard enconding
set smarttab                      "Be smart when using tab
set wrap                          "Wrap lines
set wildmenu                      "Using nice menu in place of windows status
set cursorline                    "Highlight line under cursor
set title                         "Set title by default 


" Use Ctrl-l to clear the highlit results of search
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Check if exists molokai color schema
if filereadable("$HOME/.vimrc/color/molokai.vim")
  colorscheme molokai
endif

