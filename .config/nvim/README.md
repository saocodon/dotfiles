# Neovim setup
![](https://github.com/saocodon/dotfiles/blob/main/config/nvim/shot/shot.png)
## Requirements
- Linux (replace `apt` with your package manager)
- [Neovim](https://neovim.io/)
- [git](https://git-scm.com/) for `vim-plug`
- [vim-plug](https://github.com/junegunn/vim-plug) for installing plugins
- `g++`/[MinGW for Windows](https://sourceforge.net/projects/mingw/) for C++ compilation

## Properties
This copy of Neovim is shipped with:
### Themes
- [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)
### Others
- [Lightline status bar](https://github.com/itchyny/lightline)
- [NerdTree file browser](https://github.com/preservim/nerdtree)
- [vim-polyglot syntax highlighter](https://github.com/sheerun/vim-polyglot)

## Installation
### Initial installation
Clone `init.vim` and install each components one by one (it may throw errors).
### `ccls` installation (Linux only, Windows have to build from source)
- Install NodeJS 12.12+:
```shell
sudo apt-get install nodejs
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nano ~/.zshrc
```
- Add the following content into the file and save:
```shell
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```
```shell
exec bash
nvm install 12.12.0
nvm alias default 12.12.0
sudo apt install ccls
nvim
:CocConfig
```
- Copy from [coc-settings.json](https://github.com/saocodon/dotfiles/blob/main/config/nvim/coc-settings.json)
- Copy example coc key bindings and other vim config from [here](https://github.com/neoclide/coc.nvim#example-vim-configuration).
- Enable C++17: copy [.ccls](https://github.com/saocodon/dotfiles/blob/main/.config/nvim/plug/coc/.ccls) in root project folder.

[Full guide](https://www.youtube.com/watch?v=ViHgyApE9zM)

## Usage
- Leader key is the **space** key.
### Keymap
#### Neovim built-in settings
##### Switching between panes
+ `Ctrl + H` for **left** pane.
+ `Ctrl + L` for **right** pane.
+ `Ctrl + J` for **bottom** pane.
+ `Ctrl + K` for **top** pane.
##### Navigation
+ `m` to move down 10 lines.
+ `,` to move up 10 lines.
##### C++ compilation
+ `:wc` to compile.
##### Editing
+ `:cm` to comment current line/selected lines (syntax. `:[range (e.g 11,13)]cm`)
#### Plugin settings
##### NerdTree
+ `Leader + F` for viewing file.
+ `Leader + T` for toggling.
##### Tabs
+ `Ctrl + T` for new tab.
+ `Ctrl + W` for closing current tab.
+ `Tab` for switching to next tab.
+ `Shift + Tab` for switching to previous tab.
##### coc (Example key bindings)
- `Tab` for completion.
- `<cr>` to choose first completion item.
- `gd` to jump to definition
- `gr` for references
- `gy` for type definition
- `K` for documentation
- `Leader + rn` for renaming
- `if`, `ic` for func/class selection in visual mode
- Diagnostics:
  - `Space + a` to list diagnostics.
  - `[g` and `]g` to go prev/next in diagnostics.

# References
- [doi dev - YouTube](https://www.youtube.com/channel/UC9aq09doyUlJCUToCqWYtDA)
- [How to pip install neovim? - Reddit](https://www.reddit.com/r/neovim/comments/oczrmc/how_to_pip_install_neovim/)
- [nvm command not found :( - DEV Community](https://dev.to/duhbhavesh/nvm-command-not-found-1ho)
- [I want to install nodejs with latest version - Stack Overflow](https://stackoverflow.com/questions/58405961/i-want-to-install-nodejs-with-latest-version)
- [ii.com: Installing GVim and Vim on Windows](https://www.ii.com/install-vim-gvim-on-windows/)
