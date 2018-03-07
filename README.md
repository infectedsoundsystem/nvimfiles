# Neovim/Vim 8 Configuration

Fork of [infectedsoundsystem/vimfiles](https://github.com/infectedsoundsystem/vimfiles) for Neovim and Vim 8, to avoid breaking compatibility and existing automated installs.

## Dependencies
Neovim 0.2.0+ with Python 3 module
OR
Vim 8.0+ (compiled with Lua/Python 3 support)

Git, Lua, Exuberant Ctags, Python 3

If only have access to Vim 7.4, or Vim 8 without Lua/Python 3, use legacy [vimfiles](https://github.com/infectedsoundsystem/vimfiles) configuration.

### Font
[Droid Sans Mono Slashed for Powerline](https://github.com/powerline/fonts/tree/master/DroidSansMonoSlashed): for gVim and terminal emulator on local machine (set this manually in terminal emulator), is patched for use by Airline.

Otherwise use:

[Droid Sans Mono Slashed](http://www.cosmix.org/software/#Drois%20Sans%20Mono%20%28Slashed%20Zero%29)


### Syntax checkers for Syntastic
https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers


## Install
### Linux
Install packages for dependencies, then

```bash
sudo pip3 install --upgrade -r requirements.txt
./setup.sh
```

### Windows
Forever @todo - configuration untested on Windows
