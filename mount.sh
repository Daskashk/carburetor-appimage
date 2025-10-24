#!/bin/bash

CHROOT_DIR="./root"

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
sudo chroot "$CHROOT_DIR" /usr/bin/bash

# Mensagem ao sair do chroot
echo "Saindo do chroot..."
