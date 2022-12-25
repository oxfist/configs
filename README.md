# ⚙️ Configs

Development environment configurations.

## 🐠🛸 Fish + Starship

### Set up

1. Copy `dotfiles/.config/fish` folder to `~/.config/`
2. Copy `dotfiles/.config/starship.toml` to `~/.config/`

## ✨ Neovim

> ℹ️ Neovim v0.8 is required.

### Requirements

- `rxvt-unicode-truecolor` (Linux only)
- [`prettierd`](https://github.com/fsouza/prettierd)
- [`eslint_d`](https://github.com/mantoni/eslint_d.js)

### 🚀 Set up Neovim

1. Copy the `dotfiles/.config/nvim` folder to `~/.config/`
2. Install `packer` by running:

   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.Neovim
   ```

## 📺 Command-line Utilities

1. `nvm`: if using Fish, [install wrapper via Oh-My-Fish](https://github.com/derekstavis/plugin-nvm)
2. [`zoxide`](https://github.com/ajeetdsouza/zoxide)
3. [`delta`](https://github.com/dandavison/delta)
4. [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)

## Install fonts

Code:

1. Source Code Pro with patched Nerd Fonts
2. [Monaco with patched Nerd Fonts](https://github.com/Karmenzind/monaco-nerd-fonts) (for glyphs in `fish` and `nvim-tree`)

Other serif and sans-serif fonts (Linux only):

1. Noto Sans (`noto-fonts`)
2. Adobe Source Han Sans (`adobe-source-han-sans-otc-fonts`)
3. Roboto (`ttf-roboto`)
