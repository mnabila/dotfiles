#!/bin/env sh

: '
  ██████                           ██ ██   ██   ██      ██ ██    ██
 ░█░░░░██                         ░██░░   ░██  ░██     ░██░░    ░░
 ░█   ░██   ██████   ███████      ░██ ██ ██████░██     ░██ ██    ██  ██████
 ░██████   ░░░░░░██ ░░██░░░██  ██████░██░░░██░ ░██████████░██   ░██ ██░░░░██
 ░█░░░░ ██  ███████  ░██  ░██ ██░░░██░██  ░██  ░██░░░░░░██░██   ░██░██   ░██
 ░█    ░██ ██░░░░██  ░██  ░██░██  ░██░██  ░██  ░██     ░██░██ ██░██░██   ░██
 ░███████ ░░████████ ███  ░██░░██████░██  ░░██ ░██     ░██░██░░███ ░░██████
 ░░░░░░░   ░░░░░░░░ ░░░   ░░  ░░░░░░ ░░    ░░  ░░      ░░ ░░  ░░░   ░░░░░░
'

# Copyright (C) 2019 BanditHijo
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see http://www.gnu.org/licenses/.

# Author  : Rizqi Nur Assyaufi
# Website : https://bandithijo.com
# Email   : bandithijo@gmail.com
# Created : 2019/02

# README
# File install.sh ini adalah shell script sederhana untuk meng-install/update
# theme yang akan kita gunakan.

# CARA INSTALASI
# File install.sh ini harus berada di dalam direktori theme.
# Kemudian, tinggal menjalankan dengan perintah:
#
# $ ./install.sh
#
# Dibutuhkan password root.

namaDir=`basename $PWD`

# mendefinisikan nama tema
namaTema=$namaDir

# membuat direktori tema pada dir. slim/themes/
sudo mkdir -p /usr/share/slim/themes/$namaTema
echo -e '\n[DONE] Direktori tema:' $namaTema 'berhasil dibuat!'

# mengcopy seluruh isi file ke dalam dir. slim/themes/
sudo cp * /usr/share/slim/themes/$namaTema
echo '[DONE] File-file tema berhasil dicopy ke dir. slim/themes'

# menginstall tema
sudo sed -i "s/^current_theme.*$/current_theme        $namaTema/g" /etc/slim.conf
echo '[DONE] Berhasil memasang tema:' $namaTema 'pada slim.conf'
