# My dotfiles

This directory contains the dotfiles for my system

## MacOS

### Install homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
### Install Git

```
brew install git
```
### Clone dotfiles repo while pwd is ~/


```
git clone https://github.com/j-ramus/dotfiles.git
```

Install bundle

```
$ brew install bundle

```

Run bundle on the Brewfile

```
$ brew bundle --file=~/dotfiles/brew/Brewfile
```
### Stow dotfiles

Move to the dotfiles directory
```
cd ~/dotfiles
```
``

then use GNU stow to create all symlinks

```
$ stow .
```
or by individual package

```
$ stow <directory name>
```

To backup brew
```
$ brew bundle dump
```

