Setup Description
-----------------

These dotfiles are intended to be "installed" by [GNU Stow](https://www.gnu.org/software/stow/) - as such, they are organised by role, which you can install individually.

The `setup.sh` script will ask you which roles you want to install, one at a time.

Installation
------------

1. Clone this repo (along with the current vim plugins)
    `git clone https://github.com/llamalump/.dotfiles --recursive ~/.dotfiles`
1. Change directory to `.dotfiles` and either:
    1. Install each role manually with `stow -t ~ <role>`
    1. Run `setup.sh` to ask you which roles you want to install

**NB:** for the `vim` role, you will need to run `:PlugInstall` in a vim editor to install the plugins (they're not tracked in this repo).

Acknowledgments
---------------

* Inspired by [Kirikae's dotfiles](https://github.com/kirikae/.dotfiles)
