# Configs

Development environment configurations.

## Fish + Starship

### Configuration

1. Copy the `.config/fish` folder to `~/.config/`
2. Copy `.config/starship.toml` to `~/.config/`

## Neovim

### Requirements

- `curl`
- Node 12.x
- `rxvt-unicode-truecolor` (Arch only)

### Configuration

1. Copy the `.config/nvim` folder to `~/.config/`
2. Install `vim-plug` by running:

   ```bash
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   ```

## Command-line Utilities

1. `nvm`: if using Fish, install via Oh-My-Fish
2. [`zoxide`](https://github.com/ajeetdsouza/zoxide)
3. [`delta`](https://github.com/dandavison/delta)
4. [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)

## Install fonts

1. Source Code Pro with patched Nerd Fonts
2. Google Noto: package `noto-fonts`
3. Adobe Source Han Sans: package `adobe-source-han-sans-otc-fonts`
4. Install [Monaco with patched in Nerd Font](https://github.com/Karmenzind/monaco-nerd-fonts) to properly display glyphs used by vim-airline and NERD Tree
5. Roboto: package `ttf-roboto`
