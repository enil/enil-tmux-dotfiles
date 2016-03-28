# enil-tmux-dotfiles

My tmux dotfiles, use at your own risk and have fun!
The configuration should work both on OS X and Linux with tmux 1.9 and 2.0.

## Installation

Run `make install` and it will generate and symlink everything to the home directory.
I prefer to keep the git under `~/.dotfiles/tmux`.

The following files will be installed:

* `$HOME/.tmux.conf`

**Warning**: because of limitations in the OS X version of `ln`, currently any existing files in the home directory
will be overwritten without creating a backup or prompt, make sure to move or create a backup of `.tmux.conf` if needed
before running `make install`.

