# Vim Setup Notes

## What Is This?

Notes to self about how I configured vim.

## Offline wishlist

This stuff should get migrated to git issues, but here to note offline wishlist.

* Navigation
    * Ideally different level of modifiers lead to different levels of movements
    * Go to end of visual selection with (or beginning) rather annoying
* Funny deletions
    * Clear leading and trailing whitespace

## Cloning

```
mkdir ~/.vimswap
mkdir ~/.vim
# git clone git@github.com:brodieG/vim.git ~/.vim
git clone --recursive https://github.com/brodieG/vim.git ~/.vim
echo "source ~/.vim/vimrc" > ~/.vimrc
```
Then, to update:
```
git pull && git submodule update --init --recursive
```
## Vim Installation

Stuck at 7.3 on OSX 10.9.5, so upgrading:

```
brew install mercurial
brew install vim # Failed can't find some vim version
brew update      # Updated vim formula
brew install vim
```

Then update `.bash_profile` to source `.bashrc`, and add:

```
alias vim="/usr/local/bin/vim"
```

Also, major PITA but patogen stuff will not load if we rely on `.vim/vimrc` so we absolutely need to keep the `.vimrc` file, which sucks.

## Plugins

### Install Notes
Using `pathogen`.  General methodology is to use git submodules to install plugins to the extent they are on git:

```
cd ~/.vim/bundle
git submodule add https://github.com/tpope/vim-unimpaired.git \
 vim-unimpaired
git submodule add https://github.com/scrooloose/nerdtree.git
```

It seems like we need to be in the `bundle` directory otherwise annoying stuff happens with gitignore, etc.

### Plugin Notes

####

ctrl-space: seems interesting, but perhaps more complicated than I need.  Main issue is that it appears to require too many keystrokes to do what I want (open a file).  It's nice that it start by showing the open buffers.

ctrl-p: seems like a good match, especially in mixed mode.  Shame it doesn't default by showing buffers, or doesn't show status like `:ls` does.  Also, not clear that it actually works with putty.

