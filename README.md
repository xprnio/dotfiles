# .dotfiles

### Goal
The goal of this repo is to completely automate the process of setting up my desktop environment on whatever Arch-based installation I'm running.

Currently (as of writing this) I am running an Arch-based distro called [EndeavourOS](https://endeavouros.com/), but plan on moving to a custom Arch installation later down the line.
But since I'm often too lazy to set it all up manually, I've decided to start slowly putting together a set of tools I could run on any Arch-based installation.

### Getting Started
This repo is meant for my Arch + i3wm setup so these instructions assume an Arch-based distro,
so if you use a different distro, you'll need to look for and install the necessary dependencies manually (see below).

This repo makes heavy use of Makefiles because Arch very often comes with it already installed.

The dotfiles in this repo are also split up into multiple templates (where it makes sense to do so).
These split templates are put together using `go-tpl`, a simple go application that just combines templates in a recursive manner.
The main reason for this is because i3wm does not support split configurations and so I decided to solve it while having fun.
The source code for `go-tpl` can be found under the `utils/go-tpl/` directory.

The install process this repo follows is as follows:
1. Build all the included utilities (currently just `go-tpl`)
2. Put together the necessary configurations using `go-tpl`
3. Create symbolic links for all the produced configurations

### Dependencies
In order to have this repo work from anything from a clean Arch installation all the way up to an Arch-based distro like EndeavourOS,
I'll try to include all the dependencies needed in here. This may take a while, but sooner or later I should have it fully-complete.
As such, I advise you to check the source code for yourself to see if there's anything missing before even attempting to install this.

For the time being, we can assume the following dependencies:
- `i3-wm` - [A tiling window manager for X11](https://i3wm.org/)
- `polybar` - [A fast and easy to use tool for creating status bars](https://polybar.github.io/)
- `go` - [The Go programming language](https://go.dev/)
- `make` - [GNU Make](https://www.gnu.org/software/make/)

```bash
sudo pacman -S --needed make i3-wm polybar go
```

### Installing
Since the goal of this project is to have everything automated, you should generally be all set with just running the following:
```bash
make install
```

