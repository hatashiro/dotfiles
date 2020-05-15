# dotfiles

A complete dev environment of [@utatti](https://github.com/utatti)

## Prerequisites

### Zsh packages

Install with [Homebrew](https://brew.sh/) or other package managers.

```txt
zsh
zsh-autosuggestions
zsh-completions
zsh-history-substring-search
zsh-syntax-highlighting
```

Install Prezto.

```bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git \
  "${ZDOTDIR:-$HOME}/.zprezto"
```

### Node

Install [NVM](https://github.com/nvm-sh/nvm) and the latest
[Node.js](https://nodejs.org/en/) and [npm](https://www.npmjs.com/).

## How to use

```bash
git clone https://github.com/utatti/dotfiles.git .dotfiles
cd .dotfiles

# Set `zsh` as the default shell in macOS.
./zsh.sh

# Install configs.
./install.sh
```

## License

[MIT](LICENSE)
