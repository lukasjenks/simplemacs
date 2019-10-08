# Lukas' emacs config

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