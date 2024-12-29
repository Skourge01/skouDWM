#!/bin/bash

# Caminho para o arquivo .xinitrc
XINITRC="$HOME/.xinitrc"

# Conteúdo a ser escrito
cat > "$XINITRC" << EOF
#!/bin/sh

# Configura o layout dos monitores
xrandr --output HDMI-1 --left-of eDP-1

# Define o wallpaper
feh --bg-scale images/wallpapers/literal-wallpaper.jpg

# Inicia o status bar (slstatus)
slstatus &

# Executa o dwm
exec dwm
EOF

# Torna o arquivo executável
chmod +x "$XINITRC"

echo ".xinitrc configurado e pronto para uso!"
