# Используем базовый образ
FROM feztix/jenkins-essential-image

# Создаем директорию для ключей SSH
RUN mkdir /home/${CTF_USERNAME}/.ssh

# Копируем публичный ключ в файл authorized_keys
COPY id_rsa.pub /home/${CTF_USERNAME}/.ssh/authorized_keys

# Меняем права на директорию .ssh и файл authorized_keys
RUN chown ${CTF_USERNAME}:${CTF_USERNAME} /home/${CTF_USERNAME}/.ssh /home/${CTF_USERNAME}/.ssh/authorized_keys
RUN chmod 700 /home/${CTF_USERNAME}/.ssh
RUN chmod 600 /home/${CTF_USERNAME}/.ssh/authorized_keys

# Запрещаем парольную аутентификацию
RUN sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

