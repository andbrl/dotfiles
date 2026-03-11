export DOTNET_ROOT=/usr/local/share/dotnet
export PATH="$PATH:$DOTNET_ROOT:$HOME/.dotnet/tools"

# persist history through zsh sessions
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_GLOB
