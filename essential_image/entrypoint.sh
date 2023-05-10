#!/bin/bash

# Создаем пользователя с указанными данными
useradd -m -d /home/${CTF_USERNAME} -s /bin/bash ${CTF_USERNAME}

# Устанавливаем пароль для пользователя
echo "${CTF_USERNAME}:${CTF_PASSWORD}" | chpasswd

# Запускаем SSH сервер
exec /usr/sbin/sshd -D

