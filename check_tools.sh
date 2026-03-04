#!/bin/bash

packages=(
git
curl
wget
unzip
htop
tree
jq
)

echo "Sprawdzam ktore narzedzia sa zainstalowane..."

for pkg in "${packages[@]}"; do
	if ! command -v "$pkg" >/dev/null 2>&1; then
		echo "Nie znalzalem $pkg ..."
		read -p "Czy zainstalowac $pkg ? (t/n): " answer

		if [["$answer" == "t" || "$answer" == "T"]]; then
			echo "Instaluje $pkg..."
			sudo apt install -y "$pkg"
		else
			echo "Pomijam $pkg"
		fi 

	else
		echo "$pkg jus jest zainstalowany"

	fi
done
