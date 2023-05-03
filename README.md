# My Personal mac setup

## MacOS & Finder Settings

This section documents my tweaks and preferences to make macOS consistent, productive, and tailored to my workflow.

### macOS System Settings

#### ICloud

- [ ] **Turn off ICloud Drive** (System Settings → Apple ID → iCloud → iCloud Drive) Avoids syncing Desktop/Documents.

#### Displays

- [ ] **More Space** (System Settings → Displays → More Space) More code on screen.
- [ ] **Disable true tone** (Displays → Color → True Tone: Off) Color-critical work stays accurate.

#### Control Center / Menu Bar

- [ ] **Battery percentage** (Control Center → Battery → Show Percentage: On)

#### Trackpad

- [ ] **Increase tracking speed** (System Settings → Trackpad → Tracking speed) Faster pointer movement.
- [ ] **Enable "tap to click"** (Trackpad → Point & Click → Tap to click: On)
- [ ] **Three-finger drag** (Accessibility → Pointer Control → Trackpad Options… → Enable dragging: “Three finger drag”)

#### Keyboard

- [ ] **Key Repeat: Fast / Delay Until Repeat**: Short (Keyboard → Key repeat / Delay)

#### Desktop & Dock (recommended)

- [ ] **Automatically hide and show the Dock** (Desktop & Dock → Automatically hide and show the Dock: On)
- [ ] **Disable Recent applications in Dock** (Desktop & Dock → Show recent applications in Dock: Off)
- [ ] **Reduce the dock size**

### Finder Preferences

#### View

- [ ] **Show Path Bar** (View → Show Path Bar)
- [ ] **Show Status Bar** (View → Show Status Bar)

#### General (Open Finder → Settings… (⌘,).)

- [ ] **New finder window show : Home**

### Sidebar

- [ ] **Remove unused locations** (Finder Settings → Sidebar)
- [ ] **Disable tags**
- [ ] **Add Home folder** (drag Home folder into “Favorites” for quick access)

#### Advanced

- [ ] **Show all filename extensions** (Finder Settings → Advanced)
- [ ] **Keep folders on top** (In windows when sorting by name)
- [ ] **When performing a search**: Search the Current Folder
- [ ] **Show warning before changing an extension**

## Desktop Applications

This section covers the app I install on macOS

### Applications summary

| **Application**   | **Description**                                                                              |
|-------------------|----------------------------------------------------------------------------------------------|
| Raycast           | Replacement to the default launcher, it has many handy plugins                               |
| Rectangle         |  I don't like the way full tiling manager works on MacOS Rectangle does what I need          |
| Google Chrome     | Just a no-fuss, dependable browser I trust for browsing and development.                     |
| Ghostty           | My favorite terminal emulator                                                                |
| Obsidian          | Where I take all my notes                                                                    |
| JetBrains Toolbox | I use the Jetbrains IDEs this help with managing installs and updates                        |
| Gitkraken         | I could use cli or lazyGit but I like this tool                                              |
| Docker Desktop    | The easiest way to setup and use Docker and with a friend on the team, it feels even better. |


### Applications configurations

- Raycast ([website](https://www.raycast.com/))
    - **Tailwind Plugin**: Install via Raycast Store: provides instant Tailwind CSS docs and class search.
    - **Iconify**: Install via Raycast Store: enables quick access to thousands of icons.
- Rectangle ([website](https://rectangleapp.com/))
    - Set gaps between windwos to 20px for the nice aesthetic.
- Google Chrome ([website](https://www.google.com/chrome/))
    - Set `daily.dev` as my homepage.
    - Sync with Google account for bookmarks, extensions, and history.
- Obsidian ([website](https://obsidian.md/))
    - WIP : List plugins and config.
- JetBrains Toolbox ([website](https://www.jetbrains.com/toolbox-app/))
    - Sync with Jetbrains account.
- GitKraken ([website](https://www.gitkraken.com/git-client))
    - Jetdev provides me with a Pro subscription.
- Docker Desktop ([website](https://www.docker.com/products/docker-desktop/))
    > Commercial use of Docker Desktop in larger enterprises (more than 250 employees OR more than $10 million USD in annual revenue) requires a paid subscription.

## Terminal & Terminal Applications

Even though I love good desktop apps, when I’m not in an IDE I live in the terminal.

### Terminal Applications summary

| Tool     | What it is                                                   | Link                                     |
|----------|--------------------------------------------------------------|------------------------------------------|
| Ghostty  | Fast, GPU-accelerated, macOS-native terminal emulator        | [Website](https://ghostty.org/)          |
| Zsh      | Interactive, highly customizable shell (default on macOS)    | —                                        |
| Homebrew | Package manager for installing & updating CLI tools and apps | [Website](https://brew.sh/)              |
| Neovim   | Modal editor for fast edits directly in the terminal         | [Repo](https://github.com/neovim/neovim) |

#### Utilities

Here are many tools I install as drop-in replacement of default commands.

| Command        | Description                           | Link                                            |
|----------------|---------------------------------------|-------------------------------------------------|
| ripgrep (`rg`) | Faster `grep` for file contents       | [GitHub](https://github.com/BurntSushi/ripgrep) |
| fd             | Friendlier, faster `find` by filename | [GitHub](https://github.com/sharkdp/fd)         |
| zoxide         | Smarter `cd` with directory jumping   | [GitHub](https://github.com/ajeetdsouza/zoxide) |
| eza            | Better `ls` with icons/tree           | [GitHub](https://github.com/eza-community/eza)  |
| bat            | Better `cat` with syntax highlighting | [GitHub](https://github.com/sharkdp/bat)        |

### Quick install

Bootstraps my macOS terminal setup.

**It does**

* Runs `scripts/bootstrap.sh` (Homebrew + Brewfiles)
* Installs **Oh My Zsh** if missing, ensures Zsh plugins
* Prompts to **overwrite `~/.zshrc`** with `scripts/snippets/zshrc-snippet.zsh`
* Copies dotfiles: **Ghostty** → `~/.config/ghostty/`, **bat** → `~/.config/bat/`
* (Optional) Installs **NvChad** for Neovim

**Run**

```bash
# from the repo root
./scripts/quick-install.sh
```

**Notes**

* Dotfiles are **copied** (not symlinked); re-running overwrites them.
