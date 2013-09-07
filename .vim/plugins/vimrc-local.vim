"Do we have local vimrc?
if filereadable('.vimrc.local')
    " If so, go ahead and load it.
    source .vimrc.local
endif
