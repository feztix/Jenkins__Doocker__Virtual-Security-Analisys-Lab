import argparse
import docker
import random
import string

def generate_random_string(length):
    return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(length))

def start_challenge(username):
    # Генерируем случайный пароль
    password = generate_random_string(12)

    # Создаем и запускаем Docker контейнер
    docker_client = docker.from_env()
    container_port = 22
    host_port = random.randint(10000, 65000)
    container_name = f"ctf-ssh-challenge-container-{username}"
    docker_client.containers.run(
        "ctf-ssh-challenge",
        detach=True,
        name=container_name,
        environment={"CTF_USERNAME": username, "CTF_PASSWORD": password},
        ports={f"{container_port}/tcp": host_port}
    )

    # Возвращаем данные для подключения участника
    return {
        "ssh_username": "ctfuser",
        "ssh_password": password,
        "ssh_host": "your_server_ip",
        "ssh_port": host_port
    }

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Create a Docker container for a CTF challenge participant.")
    parser.add_argument("username", help="Username of the participant")
    args = parser.parse_args()

    connection_info = start_challenge(args.username)
    print(connection_info)

