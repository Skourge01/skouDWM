#!/bin/bash

# Script para instalar pacotes básicos no Arch Linux
# Inclui: fonte Fira Code, gerenciador de arquivos Thunar, Firefox, feh e Font Awesome

sudo pacman --noconfirm -S firefox ttf-fira-code ttf-font-awesome thunar || {
    echo "Erro na instalação dos pacotes"
    exit 1
}

echo "Instalação concluída com sucesso!"



