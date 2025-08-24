#!/bin/bash

# La versión actual que permite que los programas en paralelo de DAMQT320 funcionen correctamente
#   contiene lo siguiente:

# _autorebase          001091-1                     Incomplete
# alternatives         1.31-1                       Incomplete
# base-cygwin          3.8-2                        OK
# base-files           4.3-3                        Incomplete
# bash                 5.2.21-1                     Incomplete
# bzip2                1.0.8-1                      Incomplete
# ca-certificates      2024.2.69_v8.0.401-1         Incomplete
# coreutils            9.0-1                        Incomplete
# crypto-policies      20190218-1                   Incomplete
# cygutils             1.4.17-3                     Incomplete
# cygwin               3.6.0-1                      Incomplete
# cygwin-devel         3.6.0-1                      OK
# dash                 0.5.12-5                     Incomplete
# diffutils            3.11-1                       Incomplete
# editrights           1.04-1                       Incomplete
# file                 5.44-1                       Incomplete
# findutils            4.10.0-1                     Incomplete
# gawk                 5.3.1-1                      Incomplete
# getent               2.18.90-5                    Incomplete
# grep                 3.11-1                       Incomplete
# groff                1.23.0-1                     Incomplete
# gzip                 1.13-1                       Incomplete
# hostname             3.13-1                       Incomplete
# info                 7.1-2                        Incomplete
# ipc-utils            1.1-1                        Incomplete
# less                 668-1                        Incomplete
# libargp              20230708-2                   OK
# libattr1             2.5.1-1.20.g0981a7bfe487     OK
# libblkid1            2.40.2-2                     OK
# libbz2_1             1.0.8-1                      OK
# libevent2.1_7        2.1.12-1                     OK
# libfdisk1            2.40.2-2                     OK
# libffi6              3.2.1-2                      Incomplete
# libgcc1              12.4.0-3                     OK
# libgdbm6             1.24-1                       OK
# libgfortran5         12.4.0-3                     OK
# libgmp10             6.3.0-1                      OK
# libhwloc15           2.12.0-1                     OK
# libiconv2            1.17-1                       OK
# libintl8             0.22.5-1                     OK
# liblastlog2          2.40.2-2                     OK
# liblz4_1             1.9.4-1                      OK
# liblzma5             5.8.1-1                      OK
# libmpfr6             4.2.2-1                      OK
# libncursesw10        6.5+20240427-1               Incomplete
# libopenmpi40         4.1.6-1                      OK
# libopenmpifh40       4.1.6-1                      OK
# libp11-kit0          0.23.20-1                    OK
# libpcre1             8.45-1                       OK
# libpcre2_8_0         10.45-1                      OK
# libpipeline1         1.5.6-1                      OK
# libpopt-common       1.19-1                       Incomplete
# libpopt0             1.19-1                       OK
# libquadmath0         12.4.0-3                     OK
# libreadline7         8.2-2                        OK
# libsmartcols1        2.40.2-2                     OK
# libsqlite3_0         3.49.1-1                     OK
# libssl1.1            1.1.1w-1                     Incomplete
# libssl3              3.0.16-1                     Incomplete
# libstdc++6           12.4.0-3                     OK
# libtasn1_6           4.14-1                       OK
# libuchardet0         0.0.8-1                      OK
# libuuid1             2.40.2-2                     OK
# libzstd1             1.5.7-1                      OK
# login                1.13-1                       Incomplete
# man-db               2.13.0-1                     Incomplete
# mintty               3.7.8-1                      Incomplete
# ncurses              6.5+20240427-1               Incomplete
# openmpi              4.1.6-1                      Incomplete
# openssl              3.0.16-1                     Incomplete
# p11-kit              0.23.20-1                    Incomplete
# p11-kit-trust        0.23.20-1                    Incomplete
# rebase               4.6.6-1                      Incomplete
# run                  1.3.4-2                      Incomplete
# sed                  4.9-1                        Incomplete
# tar                  1.35-2                       OK
# terminfo             6.5+20240427-1               Incomplete
# tzcode               2025b-1                      Incomplete
# tzdata               2025b-1                      Incomplete
# util-linux           2.40.2-2                     Incomplete
# vim-minimal          9.1.1054-1                   Incomplete
# which                2.20-2                       Incomplete
# xz                   5.8.1-1                      Incomplete
# zlib0                1.3.1-1                      OK
# zstd                 1.5.7-1                      Incomplete

# Para ahorrar espacio, se pueden eliminar de c:\cygwin64:
#       \usr\src
#       \usr\share\locale
#       \usr\share\zoneinfo
#       \usr\share\info
#       \usr\share\groff
#       \bin\cygcrypto*.dll
#       \bin\strace
#       \etc\pki\tls\certs
#       \etc\pki\ca-trust
#       \etc\ssl
#       \tmp\*

# ---------------------------------------------
# Script para crear backup de una carpeta Cygwin
# Sin rutas absolutas y con exclusiones opcionales
# ---------------------------------------------

# Personaliza estos valores si lo usas sin argumentos
DEST_TAR="cygwin64_min_backup.tgz"
SOURCE_DIR="/cygdrive/c/cygwin64"
EXCLUDES=("tmp/*" "*.log" "*.pyc" "*.bak" "home/*")

# Permitir uso de argumentos: ./crear_tar_cygwin.sh output.tar.gz /ruta/a/carpeta
if [[ -n "$1" ]]; then DEST_TAR="$1"; fi
if [[ -n "$2" ]]; then SOURCE_DIR="$2"; fi

# Extrae solo el nombre de la carpeta (sin ruta) para --transform
SOURCE_NAME=$(basename "$SOURCE_DIR")

echo "Creando archivo $DEST_TAR desde $SOURCE_DIR..."
echo "Eliminando prefijo ./$SOURCE_NAME/ con --transform"

# Armar exclusiones
EXCLUDE_ARGS=()
for pattern in "${EXCLUDES[@]}"; do
    EXCLUDE_ARGS+=("--exclude=$pattern")
done

# Ejecutar tar

tar -chvzf "$DEST_TAR" \
    "${EXCLUDE_ARGS[@]}" \
    --transform="s,^./$SOURCE_NAME/,," \
    -C "$(dirname "$SOURCE_DIR")" "$SOURCE_NAME"


echo "Backup completado: $DEST_TAR"
