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
apt update
for pkg in "${packages[@]}"; do
	if ! command -v "$pkg" >/dev/null 2>&1; then
		echo "Nie znalzalem $pkg ..."
		read -p "Czy zainstalowac $pkg ? (t/n): " answer

		if [[ "$answer" == "t" || "$answer" == "T" ]]; then
			echo "Instaluje $pkg..."
			apt install -y "$pkg"
		else
			echo "Pomijam $pkg"
		fi 

	else
		echo "$pkg juz jest zainstalowany"

	fi
done


	if command -v docker >/dev/null 2>&1; then
		echo "Docker jest zainstalowany i dziala.."
	else
		read -p "Docker czy zainstalowac ? (t/n): " answer
		
		if [[ "$answer" == "t" || "$answer" == "T" ]]; then
                        echo "Instaluje Docker..."
                        curl -fsSL https://get.docker.com -o get-docker.sh
                	sh get-docker.sh
			usermod -aG docker $USER
		else
                        echo "Pomijam instalacje Docker"
                fi
	fi
