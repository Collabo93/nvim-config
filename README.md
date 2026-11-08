# Neovim Configuration

A custom Neovim setup I use on a daily basis. This repository mainly serves as my personal reference for the setup steps.

![Dashboard Screenshot](https://raw.githubusercontent.com/Collabo93/init/refs/heads/master/dashboard.png)  
![File Editing Screenshot](https://raw.githubusercontent.com/Collabo93/init/refs/heads/master/editor.png)

## Features

This section lists the plugins used in this Neovim configuration to enhance functionality and development experience. Plugins are managed with the built-in `vim.pack`.

- **alpha**: Add a Dashboard to Neovim. [Link](https://github.com/goolord/alpha-nvim)
- **catppuccin**: Pastel theme. [Link](https://github.com/catppuccin/nvim)
- **copilot**: AI-powered code completion. [Link](https://github.com/github/copilot.vim)
- **copilot chat**: AI-powered chat. [Link](https://github.com/CopilotC-Nvim/CopilotChat.nvim)
- **devicons**: Provides Nerd Font icons for use by Neovim plugins. [Link](https://github.com/nvim-tree/nvim-web-devicons)
- **diffview**: Cycle through all diffs for all modified files. [Link](https://github.com/sindrets/diffview.nvim)
- **fugitive**: Git integration for Neovim. [Link](https://github.com/tpope/vim-fugitive)
- **fzf-lua**: Fuzzy finder for files, grep and more. [Link](https://github.com/ibhagwan/fzf-lua)
- **gitsigns**: Displays Git signs in the gutter and provides Git-related utilities. [Link](https://github.com/lewis6991/gitsigns.nvim)
- **lualine**: Customizable status line for Neovim. [Link](https://github.com/nvim-lualine/lualine.nvim)
- **mini pairs**: Automatically generate paired characters. [Link](https://github.com/nvim-mini/mini.pairs)
- **modicator**: Changes the color of your cursor's line number based on the current Vim mode. [Link](https://github.com/mawkler/modicator.nvim)
- **oil**: File explorer to edit the filesystem like a buffer. [Link](https://github.com/stevearc/oil.nvim)
- **plenary**: Lua helper library, required by diffview, todo-comments and CopilotChat. [Link](https://github.com/nvim-lua/plenary.nvim)
- **tiny-cmdline**: Floating command line. [Link](https://github.com/rachartier/tiny-cmdline.nvim)
- **todo**: Highlights and manages TODO comments. [Link](https://github.com/folke/todo-comments.nvim)
- **toggleterm**: Persist and toggle multiple terminals. [Link](https://github.com/akinsho/toggleterm.nvim)
- **treesitter**: Syntax highlighting and code parsing. [Link](https://github.com/nvim-treesitter/nvim-treesitter)
- **treesitter-context**: Shows the context of the current function or block at the top. [Link](https://github.com/nvim-treesitter/nvim-treesitter-context)

## Requirements

The following tools are required to use this Neovim configuration:

- **Neovim >= 0.12.0**: The core editor. [Link](https://github.com/neovim/neovim/releases)
- **tar and curl in your PATH:**
    Required for downloading and extracting Tree-sitter grammars.
    - **tar** is used to extract parser archives
    - **curl** is used to fetch grammar repositories
    - On Windows 10/11 usually already available via `C:\Windows\System32`
- **npm**: Needed for dependencies. [Link](https://nodejs.org/)
    - **Biome**: Install via npm:
      ```bash
      npm install -g @biomejs/biome
      ```
    - **Intelephense**: Install via npm:
      ```bash
      npm install -g intelephense
      ```
    - **tree-sitter-cli**: Install via npm:
      ```bash
      npm install -g tree-sitter-cli
      ```
    - **typescript-language-server**: Install via npm:
      ```bash
      npm install -g typescript-language-server typescript
      ```
- **Environment Variables**:
    - **MinGW64**: Download [MinGW64](https://winlibs.com/) and add the `mingw64\bin` folder to your `PATH`, e.g., `C:\env_vars\mingw64\bin`.
    - **Ripgrep** (required for grep): Download [Ripgrep](https://github.com/BurntSushi/ripgrep/releases) and add its folder to your `PATH`, e.g., `C:\env_vars\ripgrep`.
    - **fzf** (required for fzf-lua): Download [fzf](https://github.com/junegunn/fzf/releases) and add the `fzf` folder to your `PATH`, e.g., `C:\env_vars\fzf`.
      On the release page the files are hidden under **Assets**, look for `fzf-<version>-windows_amd64.zip`.
      Alternatively install it with `winget install junegunn.fzf` or `scoop install fzf`.
    - **fd** (optional): Speeds up file search and respects `.gitignore`. Install with `winget install sharkdp.fd` or `scoop install fd`.
    - **Lua Language Server** (optional, but recommended): Download [Lua Language Server](https://luals.github.io/) and add its folder to your `PATH`, e.g., `C:\env_vars\lls`.
    - **marksman** (optional, for Zettelkasten system): Download [Marksman](https://github.com/artempyanykh/marksman/blob/main/docs/install.md), add the .exe to a folder and add this folder to your `PATH`, e.g., `C:\env_vars\marksman`.
    - Make sure to add npm global packages to your `PATH`. You can find the path by running:
      ```bash
      npm config get prefix
      ```
- **Nerd Fonts** (optional, but recommended): Download and install the [Nerd Font](https://www.nerdfonts.com/font-downloads) of your choice and set it as the font in your terminal for proper icon rendering.

## Shortcuts

The leader key is `<space>`. The following table lists key mappings for this Neovim configuration:

| Shortcut    | Mode            | Description                                              |
| ----------- | --------------- | -------------------------------------------------------- |
| `<C-a>`     | Normal          | Select all text in the current buffer                    |
| `<C-j>`     | Normal          | Jump to previous position                                |
| `<C-k>`     | Normal          | Jump to next position                                    |
| `<C-d>`     | Normal          | Scroll half a page down (cursor centered)                |
| `<C-u>`     | Normal          | Scroll half a page up (cursor centered)                  |
| `<A-v>`     | Normal          | Visual block mode                                        |
| `U`         | Normal          | Redo                                                     |
| `<leader>q` | Normal          | Toggle Oil file explorer                                 |
| `<leader>s` | Normal          | Replace current word in file                             |
| `<leader>n` | Normal          | Jump to next diagnostic                                  |
| `<leader>N` | Normal          | Jump to previous diagnostic                              |
| `<leader>v` | Normal/Terminal | Open a vertical split and move focus (terminal: new one) |
| `<leader>h` | Normal/Terminal | Move focus to the left window                            |
| `<leader>l` | Normal/Terminal | Move focus to the right window                           |
| `<leader>i` | Normal          | Select inside parentheses                                |
| `<leader>o` | Normal          | Select inside single quotes                              |
| `<leader>w` | Normal          | Format current buffer                                    |
| `<leader>d` | Normal          | Jump to definition                                       |
| `<leader>^` | Normal          | Jump to previous buffer                                  |
| `<leader>u` | Normal          | Toggle Undotree                                          |
| `<leader>p` | Normal          | Toggle Dashboard                                         |
| `<leader>g` | Normal          | Toggle DiffView                                          |
| `<leader>r` | Normal          | Toggle Fugitive                                          |
| `<leader>f` | Normal          | fzf-lua: Find file                                       |
| `<leader>e` | Normal          | fzf-lua: Grep string                                     |
| `<leader>c` | Normal/Terminal | Toggle Terminal                                          |
| `<leader>x` | Normal          | CopilotChat: Quick chat about the current buffer         |
| `<leader>z` | Normal          | Create a new Zettelkasten note (Windows only)            |
| `<C-s>`     | Insert          | Show LSP signature help                                  |
| `J` / `K`   | Insert          | Select next / previous entry in the completion menu      |
| `J` / `K`   | fzf-lua         | Move selection down / up                                 |
| `#`         | Visual          | Comment highlighted lines                                |
| `J`         | Visual          | Move highlighted line down                               |
| `K`         | Visual          | Move highlighted line up                                 |
| `<leader>p` | Visual          | Paste without overwriting clipboard                      |

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

### 2. (Optional) Place parsers in the correct location

Only required if you are not an administrator on your machine and cannot install parsers.
Place the `parser` and `parser-info` folders from `nvim-parsers` into the following location so Tree-sitter can detect them:

- **Windows:** `%LOCALAPPDATA%\nvim-data\site`
- **Linux:** `~/.local/share/nvim/site`

You can check the exact path with `:echo stdpath("data")`.

### 3. Start Neovim

Open Neovim:

```bash
nvim
```

Wait until `vim.pack` has installed all plugins.

### 4. Customize Your Settings

You can customize the configuration files to fit your preferences:

#### **4.1 Directory Setup**

Set your root directory, of all your projects, in the `alpha.lua` file:

- **Windows and Linux:** `%LOCALAPPDATA%\nvim\lua\plugins\alpha.lua` or `~/.config/nvim/lua/plugins/alpha.lua`

    ```lua
    -- Add your project root directory here --
    local projects_root = vim.fn.expand("~/Documents/repos/")
    ```

#### **4.2 copilot**

If you want to use GitHub Copilot, invoke the command `:Copilot setup` in Neovim to set up your GitHub account.

#### **4.3 Background Image**

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

#### **4.4 Zettelkasten**

The note shortcut (`<leader>z`) stores notes in `%USERPROFILE%\Documents\zettelkasten` and currently only works on Windows. The path is set in `lua/config/usercmd.lua`.

### 5. Project-Specific Configuration

Copy the following configuration files into each of your projects to ensure consistent code formatting:

- `biome.json`

## Done!

Restart Neovim, and you're done!
