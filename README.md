# My Personal mac setup

## Settings

- Display
	- [ ] More space
	- [ ] disable true tone in case of color work
- Trackpad
	- [ ] increase tracking speed
	- [ ] enable tap to click 
- Accesibility
	- [ ] pointer control -> trackpad options -> use trackpad for dragging -> 3 fingers


## Terminal

I prefer to use another terminal emulator instead of the default one for various reason.
At the moment I'm using Kitty for its performances but iterm2 is a strong option.

### Kitty ( [website](https://sw.kovidgoyal.net/kitty/) )

GPU based, really good performances and allow for ligatures.	

To install : https://sw.kovidgoyal.net/kitty/binary/

### Iterm2 ( [website](https://www.iterm2.com/) )

Just better than the default Terminal with a lot more feature.

To install you can use Homebrew : 
```bash
 brew cask install iterm2
```

## Package manager

### Homebrew ( [website](https://brew.sh) )

Well known packet manager for macOS, it allows you to easily install and manage application on your Mac.

Simply install by pasting the following in your terminal :

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## ZSH

macOS now already ships with zsh wich is a highly customizable shell designed to be interactive

### Oh My ZSH ( [website](https://ohmyz.sh/) )

ZSH configuration manager

To install simply paste this in your terminal : 

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Tooling

### NeoVim ( [NeoVIM](https://github.com/neovim/neovim) ) 

Like VIM but better. 


#### Neovim configuration 

I use [Astrovim](https://github.com/AstroNvim/AstroNvim) as my configuration.

It is an aesthetic and feature-rich neovim config that is extensible and easy to use with a great set of plugins.


### JetBrains Toolbox  ( [website](https://www.jetbrains.com/toolbox-app/) )

To manage JetBrains tools ( install, update, ect 

### Git and Gitkraken ( [website](https://www.gitkraken.com) )

Gitkraken is my go to tool to mange my git repositories.
