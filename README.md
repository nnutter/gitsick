# gitsick

After using [homesick][], [Dropbox][], and [homeshick][] to store my dotfiles
I realized I might be able to just make a lite wrapper around Git to similar
effect.  `gitsick` lets you store your dotfiles in multiple Git repositories
but deploys them to your home directory instead of depending on symlinks.

## Install

Put `gitsick` somewhere in your `PATH` and `source` `gitsick.sh` in your
`.bashrc`.

## Configuration

You can set the directory you store your repos in with:

    git config --global gitsick.dir <directory>

The default is `$HOME/.gitsick`.

## Synopsis

For now, `gitsick` is mostly just a wrapper around `git`.  `clone` and `init`
have different syntax due to the fact that they both allow you to specify
a target directory but with `gitsick` you would just specify a name.

    gitsick <name> init
    gitsick <name> clone <repository>
    gitsick <name> ...

[Dropbox]: https://www.dropbox.com
[homesick]: https://github.com/technicalpickles/homesick
[homeshick]: https://github.com/andsens/homeshick
