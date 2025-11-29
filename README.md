# Neovim Configuration

A custom Neovim setup I use on a daily basis. This repository mainly serves as my personal reference for the setup steps.

![Dashboard Screenshot](https://raw.githubusercontent.com/Collabo93/init/refs/heads/master/dashboard.png)  
![File Editing Screenshot](https://raw.githubusercontent.com/Collabo93/init/refs/heads/master/editor.png)

## Features

This section lists the plugins and language servers used in this Neovim configuration to enhance functionality and development experience.

- **alpha**: Add a Dashboard to Neovim. [Link](https://github.com/goolord/alpha-nvim)
- **autoclose**: Automatically pairs brackets, quotes, and other characters. [Link](https://github.com/m4xshen/autoclose.nvim)
- **biome**: Code formatter for multiple languages. [Link](https://github.com/prettier/prettier)
- **blink**: Completion Plugin. [Link](https://github.com/saghen/blink.cmp)
- **catppuccin**: pastel theme [Link](https://github.com/catppuccin/nvim)
- **copilot**: AI-powered code completion. [Link](https://github.com/github/copilot.vim)
- **devicons**: Provides Nerd Font icons for use by Neovim plugins [Link](https://github.com/nvim-tree/nvim-web-devicons)
- **diffview**: Cycle through all diffs for all modified files. [Link](https://github.com/sindrets/diffview.nvim)
- **fugitive**: Git integration for Neovim. [Link](https://github.com/tpope/vim-fugitive)
- **gitsigns**: Displays Git signs in the gutter and provides Git-related utilities. [Link](https://github.com/lewis6991/gitsigns.nvim)
- **intelephense**: PHP language server. [Link](https://intelephense.com)
- **lazy**: Plugin Manager [Link](https://github.com/folke/lazy.nvim.git)
- **lua-language-server (lua_ls)**: Lua language server. [Link](https://github.com/LuaLS/lua-language-server)
- **lualine**: Customizable status line for Neovim. [Link](https://github.com/nvim-lualine/lualine.nvim)
- **LuaSnup**: Code templates [Link](https://github.com/L3MON4D3/LuaSnip)
- **telescope**: Fuzzy finder for files, buffers, and more. [Link](https://github.com/nvim-telescope/telescope.nvim)
- **todo**: Highlights and manages TODO comments. [Link](https://github.com/folke/todo-comments.nvim)
- **toggleterm**: Persist and toggle multiple terminals [Link](https://github.com/akinsho/toggleterm.nvim)
- **treesitter**: Syntax highlighting and code parsing. [Link](https://github.com/nvim-treesitter/nvim-treesitter)
- **typescript-language-server**: TypeScript/JavaScript language server. [Link](https://github.com/typescript-language-server/typescript-language-server)
- **undotree**: Visualizes the undo history. [Link](https://github.com/mbbill/undotree)

## Requirements

The following tools are required to use this Neovim configuration:

- **Neovim >= 0.11.0**: The core editor. [Link](https://github.com/neovim/neovim/releases)
- **npm**: Needed for dependencies [Link](https://nodejs.org/)
    - **Biome**: Install via npm:
      ```bash
      npm install -g @biomejs/biome
      ```
    - **Intelephense**: Install via npm:
      ```bash
      npm install -g intelephense
      ```
- **Environment Variables**:
    - **MinGW64**: Download [MinGW64](https://winlibs.com/) and add the `mingw64\bin` folder to your `PATH`, e.g., `C:\env_vars\mingw64\bin`.
    - **Ripgrep**: Download [Ripgrep](https://github.com/BurntSushi/ripgrep/releases) and add its folder to your `PATH`, e.g., `C:\env_vars\ripgrep`.
    - **Lua Language Server**: (optional, but recommended): Download [Lua Language Server](https://luals.github.io/) and add its folder to your `PATH`, e.g., `C:\env_vars\lls`.
    - Make sure to add npm global packages to your `PATH`. You can find the path by running:
      ```bash
      npm config get prefix
      ```
- **Nerd Fonts**: Download and install any [Nerd Font](https://www.nerdfonts.com/font-downloads) and set it as the font in your terminal for proper icon rendering.
## Shortcuts

The following table lists key mappings for this Neovim configuration:

| Shortcut    | Mode   | Description                                 |
| ----------- | ------ | ------------------------------------------- |
| `<C-a>`     | Normal | Select all text in the current buffer       |
| `<C-a>`     | Normal | Redo last change                            |
| `<leader>q` | Normal | Exit current file                           |
| `<leader>s` | Normal | Replace current word in file                |
| `<leader>n` | Normal | Jump to next diagnostic error               |
| `<leader>N` | Normal | Jump to previous diagnostic error           |
| `<leader>v` | Normal | Open or close vertical split and move focus |
| `<leader>h` | Normal | Move focus to the left window               |
| `<leader>l` | Normal | Move focus to the right window              |
| `<leader>i` | Normal | Select inside parentheses                   |
| `<leader>o` | Normal | Select inside braces                        |
| `<leader>w` | Normal | Format current buffer                       |
| `<leader>u` | Normal | Toggle Undotree                             |
| `<leader>p` | Normal | Toggle Dashboard                            |
| `<leader>g` | Normal | Toggle DiffView                             |
| `<leader>f` | Normal | Telescope: Find file                        |
| `<leader>e` | Normal | Telescope: Grep string                      |
| `<leader>c` | Normal/Terminal | Toggle Termninal                   |
| `#`         | Visual | Comment highlighted lines                   |
| `J`         | Visual | Move highlighted line down                  |
| `K`         | Visual | Move highlighted line up                    |
| `<leader>p` | Visual | Paste without overwriting clipboard         |

## Installation

### 1. Clone the Repository

#### **Windows**

If you already use Neovim, delete or rename the `nvim` and `nvim-data` folders.  
If not, create an `nvim` directory.

Clone this repository into your Neovim config folder:

```bash
git clone https://github.com/Collabo93/init.git %LOCALAPPDATA%/nvim
```

#### **Linux**

Clone into the Neovim config directory:

```bash
git clone https://github.com/Collabo93/init.git ~/.config/nvim
```

### 2. Start Neovim

Open Neovim:

```bash
nvim
```

Wait until **lazy** automatically installs all plugins.

### 3. Customize Your Settings

You can customize the configuration files to fit your preferences:

#### **3.1 Directory Setup**

Set your root directory, of all your projects, in the `alpha.lua` file:

- **Windows and Linux:** `%LOCALAPPDATA%\nvim\lua\plugins\alpha.lua` or `~/.config/nvim/lua/plugins/alpha.lua`

    ```lua
    -- Add your project root directory here --
    local projects_root = vim.fn.expand("~/Documents/repos/")
    ```

#### **3.2 copilot**

If you want to use GitHub Copilot, invoke the command `:Copilot setup` in Neovim to set up your GitHub account.

#### **3.3 Background Image**

By default, this setup has a transparent background to support a terminal background image. You have two options:

a) **Set a background image**  
 Example images are in this directory:

- **Windows:** `%LOCALAPPDATA%\nvim\dashboard_img\`
- **Linux:** `~/.config/nvim/dashboard_img`

b) **Deactivate the transparent background**

- **Windows:** `%LOCALAPPDATA%\nvim\lua\plugins\catppuccin.lua`
- **Linux:** `~/.config/nvim/lua/plugins/catppuccin.lua`

Comment or delete this line:

```lua
transparent_background = true,
```

### 4. Project-Specific Configuration

Copy the following configuration files into each of your projects to ensure consistent code formatting:

- `biome.json`

## Done!

Restart Neovim, and you're done!
