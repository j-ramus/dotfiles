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

# Miscellaneous Apple Configuration

## Text Replace

# Export text replacements
1. On your Mac, choose Apple menu  > System Settings, then click Keyboard  in the sidebar. (You may need to scroll down.)

If you’re working in an app, you can also choose Edit > Substitutions > Show Substitutions, then click Text Settings.

2. Click Text Replacements on the right.

3. Select the replacements you want to export. To select them all, choose Edit > Select All.

4. Drag the selected replacements from the Text Replacements window to the desktop. This creates a backup file named Text Substitutions.plist.

# Import text replacements
1. On the Mac where you want to import the text replacements, choose Apple menu  > System Settings, then click Keyboard  in the sidebar. (You may need to scroll down.)

If you’re working in an app, you can also choose Edit > Substitutions > Show Substitutions, then click Text Settings.

2. Click Text Replacements on the right.

3. Drag the Text Substitutions.plist file from its location to the Text Replacements window, then click Done.
