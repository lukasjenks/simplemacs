# Simplemacs Emacs Distro

## Summary

#### Overview
Simplemacs is designed to be straightforward and simplistic, while at the same time incorporating the functionality and design of modern code editors with rich intellisense, project tree navigation, and tab systems like those found in VS Code, for example. Rather than clinging to old design patterns like other emacs distros (e.g. using the very "emacsy" package helm instead of embracing a modern tab bar/source tree view sidebar model), it adopts and implements these modern patterns programmers have come to expect from a modern editor, while still leveraging the extremely unique advantages emacs provides.

#### Screenshot

![alt](https://github.com/lukasjenks/simplemacs/blob/master/docs/simplemacs.png)

#### Features
Among other features, Simplemacs includes:

- Custom tab bar implementation with vim-style alt-j and alt-k navigation, tab sorting and hiding, etc.
- Source tree sidebar view options (treemacs, neotree)
- Indentation line guides that behave similarily to vscode rather than using ascii characters
- Intellisense-like language server plugin support ready to go and be configured further
- Tabbing that behaves similarily to a modern editor as opposed to the troublesome and inconsistent emacs-style tabbing
- Automatic plugin updates configurable to a certain time of day
- Various autocomplete packages independent of language servers, e.g. ido-mode, flycheck dictionary matching
- Consistently behaving code folding support bound to sensible hotkeys
- Easily added to custom keybindings with bind-key
- Well organized and easy to edit/reconfigure configuration options consolidated to a single org file (settings.org)

####

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
