# Configs

Development environment configurations.

## Fish + Starship

### Configuration

1. Copy `.config/fish` folder to `~/.config/`
2. Copy `.config/starship.toml` to `~/.config/`

## Neovim

### Requirements

- `curl`
- Node 12.x
- `rxvt-unicode-truecolor` (Arch only)
- [`prettierd`](https://github.com/fsouza/prettierd)

### Configuration

1. Copy the `.config/nvim` folder to `~/.config/`
2. Install `vim-plug` by running:

   ```bash
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   ```

## Command-line Utilities

1. `nvm`: if using Fish, [install wrapper via Oh-My-Fish](https://github.com/derekstavis/plugin-nvm)
2. [`zoxide`](https://github.com/ajeetdsouza/zoxide)
3. [`delta`](https://github.com/dandavison/delta)
4. [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)

## Install fonts

Code:

1. Source Code Pro with patched Nerd Fonts
2. [Monaco with patched Nerd Fonts](https://github.com/Karmenzind/monaco-nerd-fonts) (for glyphs in fish, `vim-airline`, and NERD Tree)

Other serif and sans-serif fonts:

1. Noto Sans (`noto-fonts`)
2. Adobe Source Han Sans (`adobe-source-han-sans-otc-fonts`)
3. Roboto (`ttf-roboto`)
