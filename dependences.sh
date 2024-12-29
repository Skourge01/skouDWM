#!/bin/bash

# Script para instalar pacotes básicos no Arch Linux
# Inclui: fonte Fira Code, gerenciador de arquivos Thunar, Firefox, feh e Font Awesome

sudo pacman --noconfirm -S firefox ttf-fira-code ttf-font-awesome thunar xorg-server xorg-xinit libx11 libxft libxinerama libxrandr lxappearance materia-gtk-theme feh dmenu easyeffects || {
    echo "Erro na instalação dos pacotes"
    exit 1
}

echo "Instalação concluída com sucesso!"



