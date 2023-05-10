# Используем базовый образ Ubuntu
FROM ubuntu:20.04

# Устанавливаем необходимые пакеты и обновляем систему
RUN apt-get update && apt-get upgrade -y && apt-get install -y openssh-server

# Создаем директорию для работы SSH
RUN mkdir /var/run/sshd

# Создаем пользователя ctfuser
RUN useradd -m -d /home/ctfuser -s /bin/bash ctfuser

# Устанавливаем пароль для пользователя ctfuser
RUN echo 'ctfuser:password' | chpasswd

# Разрешаем парольную аутентификацию
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Устанавливаем локаль
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Открываем порт 22 для SSH
EXPOSE 22

# Запускаем SSH сервер
CMD ["/usr/sbin/sshd", "-D"]

