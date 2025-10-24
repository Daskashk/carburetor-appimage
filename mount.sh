#!/bin/bash

CHROOT_DIR="./app"

# Função para desmontar os diretórios
cleanup() {
    echo "Desmontando diretórios..."
    sudo umount -lf "$CHROOT_DIR/tmp"
    sudo umount -lf "$CHROOT_DIR/proc"
    sudo umount -lf "$CHROOT_DIR/sys"
    sudo umount -lf "$CHROOT_DIR/dev"
    echo "Diretórios desmontados com sucesso."
}

# Configura o trap para executar a limpeza ao sair
trap cleanup EXIT

# Monta os sistemas de arquivos necessários
echo "Montando diretórios..."
sudo mount --bind /tmp/ "$CHROOT_DIR/tmp"
sudo mount --bind /proc/ "$CHROOT_DIR/proc"
sudo mount --bind /sys/ "$CHROOT_DIR/sys"
sudo mount --bind /dev/ "$CHROOT_DIR/dev"
echo "Diretórios montados com sucesso."

# Entra no chroot
echo "Entrando no chroot..."
sudo chroot "$CHROOT_DIR" /usr/bin/bash -c "apt update && apt upgrade -y && apt install wget curl -y && curl -C - -L -O https://framagit.org/-/project/67091/uploads/35726bec322917933fa728781c0ece30/carburetor_5.1.1-1_all.deb && dpkg -i *.deb && apt install -f --no-install-recommends -y && apt install -y --no-install-recommends wget curl gsettings-desktop-schemas adwaita-icon-theme adwaita-icon-theme-legacy gnome-icon-theme locales && apt clean && apt autoclean && sed -i '7,515 s/^#//' /etc/locale.gen && locale-gen && exit"

# Mensagem ao sair do chroot
echo "Saindo do chroot..."
