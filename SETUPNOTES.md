# Vim Setup Notes

## What Is This?

Notes to self about how I configured vim.

## Cloning

```
mkdir ~/.vimswap
mkdir ~/.vim
git clone git@github.com:brodieG/vim.git ~/.vim
echo "source ~/.vim/vimrc" > ~/.vimrc
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

Using `pathogen`.  General methodology is to use git submodules to install plugins to the extent they are on git:

```
cd ~/.vim/bundle
git submodule add https://github.com/tpope/vim-unimpaired.git \
 vim-unimpaired
```

It seems like we need to be in the `bundle` directory otherwise annoying stuff happens with gitignore, etc.
