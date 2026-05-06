#!/bin/bash

echo "SecureTrust Container - Развертывание"

# Проверяем наличие manage.py
if [ ! -f "manage.py" ]; then
    echo " Ошибка: файл manage.py не найден"
    exit 1
fi

# Проверяем наличие index.html в папке templates
if [ ! -f "tasks/templates/index.html" ]; then
    echo " Ошибка: index.html не найден в tasks/templates/"
    exit 1
fi

echo "index.html найден в tasks/templates/"

# Миграции
python manage.py migrate

# Проверка
python manage.py check

echo "================================================"
echo " Развертывание завершено"
echo " Запуск: python manage.py runserver 0.0.0.0:8080"
echo "================================================"