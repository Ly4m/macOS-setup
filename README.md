# My Personal mac setup

## Settings
### System settings

- ICloud
	- [ ] Turn off ICloud Drive
- Display
	- [ ] More space
	- [ ] disable true tone in case of color work
- Trackpad
	- [ ] increase tracking speed
	- [ ] enable tap to click 
- Control Centre
	- [ ] Battery -> Show Percentage
- Accesibility
	- [ ] pointer control -> trackpad options -> use trackpad for dragging -> 3 fingers

### Finder
- View 
	- [ ] Show Path Bar
- General
	- [ ] New finder window show : Home
- Sidebar
	- [ ] Remove useless stuff
	- [ ] Disable tags
	- [ ] Add home directory
- Advanced
	- [ ] Show all filename extensions
	- [ ] When performing a search -> Search current folder


## Terminal

I prefer to use another terminal emulator instead of the default one for various reason.
At the moment I'm using Kitty for its performances but iterm2 is a strong option.

### Kitty ( [website](https://sw.kovidgoyal.net/kitty/) )

GPU based, really good performances and allow for ligatures.	

To install : https://sw.kovidgoyal.net/kitty/binary/

More information on my configuration can be found in [./terminal/terminal.md](./terminal/terminal.md)

### Iterm2 ( [website](https://www.iterm2.com/) )

Just better than the default Terminal with a lot more feature.

To install you can use Homebrew : 
```shell
 brew cask install iterm2
```

! Do not forget to run the two commands at the end of the installation script.

## Package manager

### Homebrew ( [website](https://brew.sh) )

Well known packet manager for macOS, it allows you to easily install and manage application on your Mac.

Simply install by pasting the following in your terminal :

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## ZSH

macOS now already ships with zsh wich is a highly customizable shell designed to be interactive

### Oh My ZSH ( [website](https://ohmyz.sh/) )

ZSH configuration manager

To install simply paste this in your terminal : 

```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


## NeoVim ( [NeoVIM](https://github.com/neovim/neovim) ) 

Like VIM but better. 

I recommend using the [brew formulae](https://formulae.brew.sh/formula/neovim).

```shell
brew install neovim
```

### Neovim configuration 

I use [Astrovim](https://github.com/AstroNvim/AstroNvim) as my configuration.

It is an aesthetic and feature-rich neovim config that is extensible and easy to use with a great set of plugins.

To install :

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone the repository

```shell
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim
```

for mor info see the [repository]( https://github.com/AstroNvim/AstroNvim#%EF%B8%8F-installation)

## JetBrains Toolbox  ( [website](https://www.jetbrains.com/toolbox-app/) )

To manage JetBrains tools ( install, update, ect )

## Git and Gitkraken ( [website](https://www.gitkraken.com) )

Gitkraken is my go to tool to mange my git repositories.

## Docker

I mainly use [Docker Desktop](https://www.docker.com/products/docker-desktop/) but for some case where legal restrictions prevent the use of this tool I recomemnd using [Rancher Desktop](https://rancherdesktop.io) (without the kubernetes part)

