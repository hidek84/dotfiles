# Dotfiles

## Get started
```
cd .dotfiles
bash deploy.sh
bash initialize.sh
```

## Prezto

~/.zpreztorc
```
zstyle ':prezto:load' pmodule \
  'git' \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'prompt' \
  'syntax-highlighting' \
  'autosuggestions'
```

~/.zshrc
```
# Customize to your needs...
source $HOME/.dotfiles/.commonrc
```


## References

### Zsh - Prezto
- https://github.com/sorin-ionescu/prezto
- https://github.com/Arc0re/Iceberg-iTerm2
- https://qiita.com/kinchiki/items/57e9391128d07819c321

### Zsh - zshrc
- https://sanoto-nittc.hatenablog.com/entry/2017/12/16/213735

### Homebrew
- https://docs.brew.sh/Installation#untar-anywhere

### Dotfile Driven Development
- https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2