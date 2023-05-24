export ZSH_CUSTOM="$DOTZSH/omzcustom"
export fpath=($ZSH_CUSTOM/completions $fpath)
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
  vi-mode
  zsh-autosuggestions
)
