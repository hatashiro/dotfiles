# dotfiles

## Prerequisites

### Zsh

Install Zsh and Prezto.

```bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git \
  "${ZDOTDIR:-$HOME}/.zprezto"
```

Prezto will install required Zsh packages as its submodules.

## How to use

```bash
git clone https://github.com/utatti/dotfiles.git .dotfiles
cd .dotfiles

# Set `zsh` as the default shell in macOS.
./zsh.sh

# Or set the default shell manually (no sudo).
chsh

# Install all.
./install.sh
```

## License

[MIT](LICENSE)
