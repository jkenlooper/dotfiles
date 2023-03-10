#!/usr/bin/env -S bash -o errexit

# Create aliases for dot files in HOME replacing any existing
dotfiles="
alacritty.yml
bash_aliases
bashrc
editorconfig
gitattributes
gitconfig
profile
todo.actions.d
todo.cfg
tmux.conf
vimrc
Xresources
"
for f in $dotfiles; do
  # Remove old symbolic link if there.
	if [ -L "$HOME/.$f" ]; then
    rm "$HOME/.$f";
  fi
  # Move any existing file or directory
	if [ -f "$HOME/.$f" ] || [ -d "$HOME/.$f" ]; then
		mv "$HOME/.$f" "$HOME/.$f.old";
	fi
	ln -s "$PWD/$f" "$HOME/.$f";
done;


# Create aliases in HOME/bin replacing any existing
mkdir -p "$HOME/bin"
for f in bin/*; do
  # Remove old symbolic link if there.
	if [ -L "$HOME/$f" ]; then
    rm "$HOME/$f";
  fi
  # Move any existing file or directory
	if [ -f "$HOME/$f" ] || [ -d "$HOME/$f" ]; then
		mv "$HOME/$f" "$HOME/$f.old";
	fi
	ln -s "$PWD/$f" "$HOME/$f";
done;

# Install other commands that are typically not done via package manager. These
# are single executables that are dropped into the $HOME/bin/ directory.

# UPKEEP due: "2023-10-25" label: "fossil" interval: "+8 months"
# https://www.fossil-scm.org/home/uv/download.html
fossil_version="2.21"
has_fossil="$(command -v fossil || echo "no")"
if [ "$has_fossil" = "no" ]; then
  tmpfossil="$(mktemp)"
  os=""
  arch=""
  case "$OSTYPE" in
    'linux*') os="linux" arch="x64" ;;
    'darwin*') os="mac" arch="x64" ;;
    *) echo "The os type ($OSTYPE) is not supported" && exit 1 ;;
  esac
  case "$(uname -p)" in
    'x86_64') arch="x64" ;;
    'arm*') arch="arm" ;;
    *) echo "The arch ($(uname -p)) is not supported" && exit 1 ;;
  esac

  wget -O "$tmpfossil" "https://www.fossil-scm.org/home/uv/fossil-$os-$arch-$fossil_version.tar.gz"
  tar x -z -C "$HOME/bin" -f "$tmpfossil"
  rm -rf "$tmpfossil"
fi
