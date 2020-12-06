Description
-----------

These dotfiles are intended to be "installed" by [GNU Stow](https://www.gnu.org/software/stow/) - as such, they are organised by role, which you can install individually.

The `setup.sh` script will ask you which roles you want to install, one at a time.

Installation
------------

1. Clone this repo

    `git clone https://github.com/llamalump/.dotfiles <directory of your choice>`

1. Change to the directory where you cloned the repo, and do either of the following:
    1. Install each role manually with `stow -t ~ <role>`
    1. Run `setup.sh`, which will ask you one by one which role(s) you want to install

If there are already files (regular or symlinks) in your home directory that match those inside the dotfiles repo, you'll need to remove them, otherwise Stow won't work.

**NB:** for the `vim` role, you will need to run `:PlugInstall` in a vim editor to install the plugins (they're not tracked in this repo).

Acknowledgements
---------------

* Influenced by [Kirikae's dotfiles](https://github.com/kirikae/.dotfiles)
