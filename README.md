# Configs

Misc configurations.

## Neovim

### Requirements

- `curl`
- Node 12.x
- `rxvt-unicode-truecolor`

### Installation

1. Copy `nvim` folder to `~/.config/`
2. Install `vim-plug` by running:

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Install fonts

1. Google Noto: package `noto-fonts`
2. Adobe Source Han Sans: package `adobe-source-han-sans-otc-fonts`
3. Install [Monaco with patched in Nerd Font](https://github.com/Karmenzind/monaco-nerd-fonts) to properly display glyphs used by vim-airline and NERD Tree
4. Roboto: package `ttf-roboto`
