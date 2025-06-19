#!/bin/bash

# Параметры
WEB_SERVER=$(ip -4 addr show enp0s3 | awk '/inet / {print $2}' | cut -d'/' -f1 | head -n 1)  # IP интерфейса 
PORT="80"                     # порт веб-сервера
FILE=$(ls /var/www/html/index*) # путь к index файлу

# Проверка доступности порта
nc -z "$WEB_SERVER" "$PORT"
if [ $? -ne 0 ]; then
    exit 1
fi

# Проверка существования index файла
if [ ! -f "$FILE" ]; then
    exit 1
fi

# Если всё ок
exit 0
