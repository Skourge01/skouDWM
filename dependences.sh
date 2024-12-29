#!/bin/bash

# Verifica se é Arch Linux
if ! command -v pacman &> /dev/null; then
    echo "Este script só funciona no Arch Linux"
    exit 1
fi

# Atualiza a base de dados do pacman primeiro
echo "Atualizando base de dados do pacman..."
sudo pacman -Syu --noconfirm || {
    echo "Erro ao atualizar o sistema"
    exit 1
}

# Instala wget e git se necessário
sudo pacman --noconfirm -S wget git || {
    echo "Erro ao instalar wget e git"
    exit 1
}

# Download do MEGAsync
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR" || exit 1
wget https://mega.nz/linux/repo/Arch_Extra/x86_64/megasync-x86_64.pkg.tar.zst || {
    echo "Erro ao baixar MEGAsync"
    exit 1
}

# Instalação dos pacotes base
echo "Instalando pacotes..."
sudo pacman --noconfirm -S firefox obsidian ttf-fira-code ttf-font-awesome thunar \
    xorg-server xorg-xinit xorg-xrandr libx11 libxft libxinerama \
    lxappearance materia-gtk-theme feh dmenu easyeffects base-devel telegram-desktop && \
sudo pacman -U --noconfirm megasync-x86_64.pkg.tar.zst || {
    echo "Erro na instalação dos pacotes"
    exit 1
}

# Instalação do yay
cd "$HOME"
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si --noconfirm

# Instala cursor-bin via yay
yay -S --noconfirm cursor-bin

# Limpeza
cd "$HOME"
rm -rf yay-git
rm -rf "$TEMP_DIR"

echo "Instalação concluída!"
