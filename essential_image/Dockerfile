FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

# Создайте пользователя с именем 'user'
RUN useradd -m -s /bin/bash user

# Установите пароль для пользователя (в данном примере пароль 'password')
RUN echo 'user:password' | chpasswd

# Измените конфигурацию SSH, чтобы разрешить парольную аутентификацию
RUN sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
