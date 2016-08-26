# Vim Setup Notes

## What Is This?

Notes to self about how I configured vim.

## Offline wishlist

This stuff should get migrated to git issues, but here to note offline wishlist.

### Copy / Paste

We want:

* Delete doesn't overwrite what gets pasted with `p` when there is a prior `y`
* Anything `y` is available in the system clipboard

Solutions:

* `y` remaped to "copy to sys clipboard", this will also copy to unnamed
  clipboard
* `p` remains as is, will paste from unnamed register
* Alternate for `p` is to have it paste from \"0 register
    * Benefit is that deletions will never affect any yanks
    * Drawback is that stuff like `xp` to flip a character will not work anymore
    * Basically, what's better, never having to `\"0p` and always having to
      `x\"1p`?
* `<leader>p` remains as is, will paste from system register
* `p` remaped to "paste from sys clipboard"
* `<leader>v`

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
export PATH="/usr/local/bin:$PATH"
```

Also, major PITA but patogen stuff will not load if we rely on `.vim/vimrc` so we absolutely need to keep the `.vimrc` file, which sucks.

### Additional `brew` notes, had to:

Had to chown several `/usr/local` folders for brew to run and link properly.
This was actually for a `git` update rather than `vim` one.

## IDE Setup

### R-Vim-runtime

Ended up disabling, probably b/c slow
[R-vim-runtime](https://github.com/jalvesaq/R-Vim-runtime) and also because this
is just supposed to be the dev versions of what already comes with vim.

### Nvim-R

Actively developed, by same guy as R-Vim-runtime.  Needs tmux.  Currently
installed as a submodule, though the suggested install is to use a release.

### Tmux

For use with the Nvim-R

```
brew install tmux
```

### Tmux-Vim-R

[Tmux-Vim-R](http://manuals.bioinformatics.ucr.edu/home/programming-in-r/vim-r)

Seems like an alternative to Nvim-R, but doesn't seem as up to date as Nvim-R.
Additionally, looks like Nvim-R author was at least involved via suggestions in
the development.

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

