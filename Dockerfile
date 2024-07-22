# Используйте официальный образ Python в качестве базового образа
FROM python:3.10

# Установите рабочую директорию
WORKDIR /app

# Скопируйте файлы проекта в рабочую директорию
COPY . /app

# Установите зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Выполните миграции, загрузите фикстуры и создайте суперпользователя
CMD ["sh", "-c", "python manage.py makemigrations && \
    python manage.py migrate && \
    python manage.py loaddata fixtures/goods/cats.json && \
    python manage.py loaddata fixtures/goods/prod.json && \
    python manage.py loaddata fixtures/goods/admin.json && \
    python manage.py runserver 0.0.0.0:8000"]
