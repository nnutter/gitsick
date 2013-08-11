# gitsick

After using [homesick][], [Dropbox][], and [homeshick][] to store my dotfiles
I realized I might be able to just make a lite wrapper around Git to similar
effect.  `gitsick` lets you store your dotfiles in multiple Git repositories
but deploys them to your home directory instead of depending on symlinks.

[Dropbox]: https://www.dropbox.com
[homesick]: https://github.com/technicalpickles/homesick
[homeshick]: https://github.com/andsens/homeshick

## Install

Put `gitsick` somewhere in your `PATH` and `source` `gitsick.sh` in your
`.bashrc`.

## Configuration

You can set the directory you store your repos in with:

    git config --global gitsick.dir <directory>

The default is `$HOME/.gitsick`.

## Synopsis

    gitsick <name> init
    gitsick <name> clone <repository>
    gitsick <name> ...

For now, `gitsick` is mostly just a wrapper around `git`.

`clone` and `init` have different syntax due to the fact that they both allow
you to specify a target directory but with `gitsick` you would just specify
a name.

`status` hides untracked files by default since not doing so would easily kill
performance.  You should be able to create a `.gitignore` files if you want to
see untracked files.  You will also need to add `-u` to your `status` command.

## Migrating From `homesick` or `homehick`

Create a new repo with `gitsick`:

    gitsick dotfiles init

Import your `homesick` repo's home directory:

    gitsick --work-tree ~/.homesick/repos/dotfiles/home \
        dotfiles add ~/.homesick/repos/dotfiles/home/

Commit and push:

    gitsick dotfiles commit -m 'import from homeshick'
    gitsick dotfiles remote add origin ...
    gitsick dotfiles push -u origin master

## Caveat

You can get 90% of the value of `gitsick` using just an `alias`:

    alias dotfiles="GIT_DIR=$HOME/.dotfiles.git GIT_WORK_TREE=$HOME git'

If you plan on using multiple repositories then you will need to deal with that
in the same way `gitsick` does.  You will also want to make a `git` alias to
not show untracked files for `git status` or to setup a `.gitignore` file.
