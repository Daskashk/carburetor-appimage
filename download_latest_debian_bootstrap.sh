#!/bin/bash

# Define a URL base para o último build bem-sucedido
BASE_URL="https://doi-janky.infosiftr.net/job/tianon/job/debuerreotype/job/amd64/lastSuccessfulBuild/artifact/sid/rootfs.tar.xz"

# Define o nome do arquivo de destino
DEST="rootfs-latest.tar.xz"

# Faz o download do rootfs mais recente
curl -L -o "$DEST" "$BASE_URL"

echo "Download concluído: $DEST"
