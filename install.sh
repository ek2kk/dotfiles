#!/usr/bin/env bash
# Symlink dotfiles into $HOME. Safe to re-run: anything else in the way is kept as *.bak.<timestamp>.
set -eu

dotfiles=$(cd "$(dirname "$0")" && pwd)
stamp=$(date +%Y%m%d%H%M%S)

link() {
	local src=$dotfiles/$1 target=$HOME/$1

	[ "$(readlink "$target" || true)" = "$src" ] && return 0

	mkdir -p "$(dirname "$target")"
	if [ -e "$target" ] || [ -L "$target" ]; then
		mv "$target" "$target.bak.$stamp"
		echo "backed up $1 to $1.bak.$stamp"
	fi
	ln -s "$src" "$target"
	echo "linked $1"
}

# Same files and checksums as https://typographic.systems/install.sh, but pinned here
install_font() {
	local name=$1 sha=$2 zip

	[ -e "$HOME/Library/Fonts/$name[wght].ttf" ] && return 0

	zip=$(mktemp)
	curl -fsSL -o "$zip" "https://typographic.systems/download/$name-1.002-ttf.zip"
	echo "$sha  $zip" | shasum -a 256 -c --status
	mkdir -p "$HOME/Library/Fonts"
	unzip -jqo "$zip" '*/variable/*.ttf' -d "$HOME/Library/Fonts"
	rm -f "$zip"
	echo "installed font $name"
}

for path in .zshenv .zprofile .zshrc; do
	link "$path"
done

for path in aerospace fastfetch ghostty git lazygit nvim starship.toml; do
	link ".config/$path"
done

# These directories also hold runtime data, so only the config file is linked
link .config/herdr/config.toml
link .config/zed/settings.json

install_font ObelMono 462b58d6d95e8541e01e45a9848c59f4fb24718c2d19706ad1476d2b617a5dd1
install_font ObelMonoMasked cfa91f8192bae87b0a9ccb6abf36d092b9149bf83e4d2d377c24ff82f06543a1
