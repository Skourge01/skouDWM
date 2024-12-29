#!/bin/bash

# Nome do usuário (substitua por seu nome de usuário)
USER_NAME="carlos"

# Criação do diretório para sobrescrever a configuração do getty
echo "Configurando login automático no tty1..."
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d

# Criação do arquivo de override para login automático
echo "[Service]" | sudo tee /etc/systemd/system/getty@tty1.service.d/override.conf > /dev/null
echo "ExecStart=" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/override.conf > /dev/null
echo "ExecStart=-/usr/bin/agetty --autologin $USER_NAME --noclear %I \$TERM" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/override.conf > /dev/null

# Recarregar as configurações do systemd
echo "Recarregando systemd..."
sudo systemctl daemon-reload

# Reiniciar o serviço getty para aplicar as mudanças
echo "Reiniciando o serviço getty@tty1..."
sudo systemctl restart getty@tty1

# Mensagem de sucesso
echo "Login automático configurado com sucesso para o usuário '$USER_NAME'."
echo "O 'startx' será executado automaticamente após o login no tty1."
