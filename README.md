Как запустить:
1. Установить Docker  
2. Скопировать репозиторий git clone https://github.com/St1ppp/summerwebapi  
3. В консоль ввести docker-compose up  

для админки автоматически создается пользователь с данными : "username"="admin", "password"="root"  

url адреса:
'localhost:8000/admin/' - админ панель  
'localhost:8000/api/register/' - Регистрация (в теле запроса должны быть аргументы username и password)  
'localhost:8000/api/token/' - Возвращает access и refresh токены (в теле запроса username и password)  
'localhost:8000/api/token/refresh/' - Возвращает новый access (в теле запроса - refresh токен)  
  
Viewsets (тут доступен весь CRUD суперпользователям и просмотр любому пользователю)  
'localhost:8000/api/products/' - Возвращает кол-во страниц, ссылку на следующую/предыдущую страницы, список продуктов  
'localhost:8000/api/products/<int>/' - Возвращает продукт по id  
'localhost:8000/api/categories/' - Возвращает кол-во страниц, ссылку на следующую/предыдущую страницы, список категорий  
'localhost:8000/api/categories/<int>/' - Возвращает категорию по id  
