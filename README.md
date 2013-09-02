vim-gofiximport
========

vim-gofiximport add the FixImport command on golang sources.


Installation
------------

### gofiximport

gofiximport should be installed and present in the PATH

    go get github.com/bonnefoa/gofiximport

### Vundle

If you use vundle, just add this line to your .vimrc and launch a BundleInstall

    Bundle 'bonnefoa/vim-gofiximport.git'

### Pathogen

If you use pathogen:

    cd ~/.vim/bundle
    git clone https://github.com/bonnefoa/vim-gofiximport.git

Usage
------------

If you wish to call FixImport on each save, add this to your .vimrc

    autocmd FileType go autocmd BufWritePre <buffer> FixImport

Or you can map a command to call it manually

    map <buffer> <leader>f :FixImport<CR>
