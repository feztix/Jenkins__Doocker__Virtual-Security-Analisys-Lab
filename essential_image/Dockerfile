# Используем базовый образ Ubuntu
FROM ubuntu:20.04

# Устанавливаем необходимые пакеты и обновляем систему
RUN apt-get update && apt-get upgrade -y && apt-get install -y openssh-server

# Создаем директорию для работы SSH
RUN mkdir /var/run/sshd

# Разрешаем парольную аутентификацию
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Устанавливаем локаль
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Создаем скрипт entrypoint.sh и делаем его исполняемым
RUN echo '#!/bin/bash\n\
\n\
# Создаем пользователя с указанными данными\n\
useradd -m -d /home/${CTF_USERNAME} -s /bin/bash ${CTF_USERNAME}\n\
\n\
# Устанавливаем пароль для пользователя\n\
echo "${CTF_USERNAME}:${CTF_PASSWORD}" | chpasswd\n\
\n\
# Запускаем SSH сервер\n\
exec /usr/sbin/sshd -D' > /entrypoint.sh && chmod +x /entrypoint.sh

# Открываем порт 22 для SSH
EXPOSE 22

# Запускаем entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


