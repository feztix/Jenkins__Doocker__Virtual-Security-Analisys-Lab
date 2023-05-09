# Jenkins__Doocker__Virtual-Security-Analisys-Lab

1. Запуск базового образа (можно создавать много пользователей)
./create_user_container.sh user1 password1 port

2. Подключение
ssh user1@<IP-адрес-хоста> -p port

2.1 Удаление контейнера
docker rm -f user_container_user1
