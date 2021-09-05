# Simplemacs Emacs Distro

## Summary

#### Overview
Simplemacs is designed to be straightforward and simplistic, while at the same time incorporating the functionality and design of modern code editors with rich intellisense, project tree navigation, and tab systems like those found in VS Code, for example. Rather than clinging to old design patterns like other emacs distros (e.g. the very "emacsy" package helm instead of embracing a modern tab bar), it adopts and implements these modern patterns programmers come to expect while still leveraging the extremely unique advantages emacs provides. 

![alt](https://github.com/lukasjenks/simplemacs/blob/master/docs/simplemacs.png)

#### Platforms
Simplemacs is designed to be cross platform, and should run in a consistent way across Linux, macOS, and Windows systems. If anything is encountered that doesn't seem to be consistent with this statement, add a new issue.

## Installation

#### Optional
Backup your ~/.emacs.d and ~/.emacs file, if you want to keep your current emacs configuration.
To do this, execute the following in the terminal:

`cd ~`

`mv .emacs.d old.emacs.d`

`mv .emacs old.emacs`

#### Replacing your configuration

`cd ~`

`rm .emacs`

`rm -rf .emacs.d`

`git clone https://github.com/lukasjenks/emacsconfig.git .emacs.d`

## Fonts
In this specific configuration, I use the font SourceCodePro-Regular,
which is included in this repository. To install the font, execute
the following (after executing the above commands):

`cd ~/.emacs.d`

`cp SourceCodePro/SourceCodePro-Regular.ttf ~/.fonts/SourceCodePro-Regular.ttf`
