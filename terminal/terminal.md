# My Terminal configuration


## Installation 

Install instructions :  https://sw.kovidgoyal.net/kitty/binary/ 

Config file are available in the [config-files](./config-files) folder but some configuration has to be done manually like downloading fonts.

## Theme

My current theme is Catpuccin ([website](https://github.com/catppuccin/catppuccin))

It is packaged with Kitty and can be selected using the following command 
```bash
kitty +kitten themes
```

## Font

My current font is JetBrains Mono ( [website](https://www.jetbrains.com/lp/mono/))
To install the font juste download them and drag and drop them in the Font Book

Then in Kitty's config file add the following settings : 

```
font_family             JetBrains Mono Regular
bold_font               JetBrains Mono Bold
italic_font             JetBrains Mono Italic
bold_italic_font        JetBrains Mono Bold Italic

font_size 14.0
```

### Nerd Fonts

To add Nerd Fonts it is not advised to use a patched font as those seems to have issues.
Best practices is to download the `NerdFontsSymbolsOnly.zip
` package from the [Release page](https://github.com/ryanoasis/nerd-fonts/releases), install it in the font book and then map the symbol by adding the following line in your kitty.conf

```
symbol_map U+23FB-U+23FE,U+2665,U+26A1,U+2B58,U+E000-U+E00A,U+E0A0-U+E0A3,U+E0B0-U+E0D4,U+E200-U+E2A9,U+E300-U+E3E3,U+E5FA-U+E6AA,U+E700-U+E7C5,U+EA60-U+EBEB,U+F000-U+F2E0,U+F300-U+F32F,U+F400-U+F4A9,U+F500-U+F8FF,U+F0001-U+F1AF0 Symbols Nerd Font Mono

```

## Icon

I do not like the default Kitty icon, to change it instruction are on [this repo](https://github.com/DinkDonk/kitty-icon)


