# Как запустить  
1. Установить Docker  
2. Скопировать репозиторий  
    ```git clone https://github.com/St1ppp/summerwebapi```  
3. Перейти в папку с проектом  
    ```cd summerwebapi```  
4. Запустить Docker  
5. В консоль ввести ```docker-compose up```  
  

# Документация API  

Все url начинаются с localhost:8000  

## Основные URL-адреса  

### `/admin/`  
Админка Django.  
Для админки автоматически создается пользователь с данными : 
```json 
{
    "username" : "admin",
    "password" : "root"
}
```  


## API для работы с продуктами  

### `GET /api/products/`  
Получение списка всех продуктов.  

**Ответ:**  
```json  
[  
  {  
    "id": 1,  
    "name": "Название продукта",  
    "slug": "slug-produkt",  
    "description": "Описание продукта",  
    "image": "ссылка_на_изображение",  
    "price": "100.00",  
    "discount": "10.00",  
    "quantity": 50,  
    "category": 1  
  }  
]  
```  
  
### `POST /api/products/`  
Создание нового продукта.  
  
**Тело запроса:**  
```json  
{  
  "name": "Название продукта",  
  "slug": "slug-produkt",  
  "description": "Описание продукта",  
  "image": "ссылка_на_изображение",  
  "price": "100.00",  
  "discount": "10.00",  
  "quantity": 50,  
  "category": 1  
}  
```  
  
### `GET /api/products/{id}/`  
Получение информации о конкретном продукте по его ID.  
  
**Ответ:**  
```json  
{  
  "id": 1,  
  "name": "Название продукта",  
  "slug": "slug-produkt",  
  "description": "Описание продукта",  
  "image": "ссылка_на_изображение",  
  "price": "100.00",  
  "discount": "10.00",  
  "quantity": 50,  
  "category": 1  
}  
```  
  
### `PUT /api/products/{id}/`  
Обновление информации о продукте по его ID.  
  
**Тело запроса:**  
```json  
{  
  "name": "Новое название продукта",  
  "slug": "new-slug-produkt",  
  "description": "Новое описание продукта",  
  "image": "новая_ссылка_на_изображение",  
  "price": "150.00",  
  "discount": "15.00",  
  "quantity": 30,  
  "category": 2  
}  
```  
  
### `DELETE /api/products/{id}/`  
Удаление продукта по его ID.  
  
## API для работы с категориями  
  
### `GET /api/categories/`  
Получение списка всех категорий.  
  
**Ответ:**  
```json  
[  
  {  
    "id": 1,  
    "name": "Название категории",  
    "slug": "slug-kategoriya"  
  }  
]  
```  
  
### `POST /api/categories/`  
Создание новой категории.  
  
**Тело запроса:**  
```json  
{  
  "name": "Название категории",  
  "slug": "slug-kategoriya"  
}  
```  
  
### `GET /api/categories/{id}/`  
Получение информации о конкретной категории по её ID.  
  
**Ответ:**  
```json  
{  
  "id": 1,  
  "name": "Название категории",  
  "slug": "slug-kategoriya"  
}  
```  
  
### `PUT /api/categories/{id}/`  
Обновление информации о категории по её ID.  
  
**Тело запроса:**  
```json  
{  
  "name": "Новое название категории",  
  "slug": "new-slug-kategoriya"  
}  
```  
  
### `DELETE /api/categories/{id}/`  
Удаление категории по её ID.  
  
## API для работы с корзинами  
  
### `GET /api/carts/`  
Получение списка всех товаров в корзине текушего авторизированного пользователя.  
  
**Ответ:**  
```json  
[  
  {  
    "id": 1,  
    "user": 1,  
    "product": 1,  
    "quantity": 2,  
    "created_timestamp": "2024-07-22T12:00:00Z"  
  }  
]  
```  
  
### `POST /api/carts/`  
Создание нового товара для корзины текущего авторизированного пользователя.  
  
**Тело запроса:**  
```json  
{  
  "user": 1,  
  "product": 1,  
  "quantity": 2  
}  
```  
  
### `GET /api/carts/{id}/`  
Получение информации о конкретном товаре в корзине по его ID.  
  
**Ответ:**  
```json  
{  
  "id": 1,  
  "user": 1,  
  "product": 1,  
  "quantity": 2,  
  "created_timestamp": "2024-07-22T12:00:00Z"  
}  
```  
  
### `PUT /api/carts/{id}/`  
Обновление информации о товаре в корзине по его ID.  
  
**Тело запроса:**  
```json  
{  
  "quantity": 3  
}  
```  
  
### `DELETE /api/carts/{id}/`  
Удаление товара из корзины по его ID.  
  
## API для аутентификации и регистрации  
  
### `POST /api/token/`  
Получение JWT токена для аутентификации.  
  
**Тело запроса:**  
```json  
{  
  "username": "имя пользователя",  
  "password": "пароль"  
}  
```  
**Ответ:**  
```json  
{  
  "access" : "access токен",  
  "refresh" : "refresh токен"  
}  
```  
  
### `POST /api/token/refresh/`  
Обновление JWT токена.  
  
**Тело запроса:**  
```json  
{  
  "refresh": "refresh токен"  
}  
```  
**Ответ:**  
```json  
{  
  "access" : "access токен",  
}  
```  
  
### `POST /api/register/`  
Регистрация нового пользователя.  
  
**Тело запроса:**  
```json  
{  
  "username": "имя пользователя",  
  "password": "пароль",  
}  
```  
  
## API для работы с пользователями  
### `GET /api/users/`  
Получение списка всех зарегестрированных пользователей.  
  
**Ответ:**  
```json  
[  
    {  
        "id": 1,  
        "password": "хэш пароля",  
        "last_login": "2024-07-21T11:41:35.612892Z",  
        "is_superuser": true,  
        "username": "admin",  
        "first_name": "",  
        "last_name": "",  
        "email": "",  
        "is_staff": true,  
        "is_active": true,  
        "date_joined": "2024-07-21T11:37:48.477454Z",  
        "groups": [],  
        "user_permissions": []  
    },  
]  
```    
  
### `POST /api/users/`  
Создание нового пользователя.  
  
**Тело запроса:**  
обязательные поля только username и password.  
```json  
{  
    "id": 1,  
    "password": "хэш пароля",  
    "last_login": "2024-07-21T11:41:35.612892Z",  
    "is_superuser": true,  
    "username": "admin",  
    "first_name": "",  
    "last_name": "",  
    "email": "",  
    "is_staff": true,  
    "is_active": true,  
    "date_joined": "2024-07-21T11:37:48.477454Z",  
    "groups": [],  
    "user_permissions": []  
},  
```  
  
### `GET /api/users/{id}/`  
Получение информации о конкретном пользователе по его ID.  
  
**Ответ:**  
```json  
{  
    "id": 1,  
    "password": "хэш пароля",  
    "last_login": "2024-07-21T11:41:35.612892Z",  
    "is_superuser": true,  
    "username": "admin",  
    "first_name": "",  
    "last_name": "",  
    "email": "",  
    "is_staff": true,  
    "is_active": true,  
    "date_joined": "2024-07-21T11:37:48.477454Z",  
    "groups": [],  
    "user_permissions": []  
},  
```  
  
### `PUT /api/users/{id}/`  
Обновление информации о пользователе по его ID.  
  
**Тело запроса:**  
```json  
{  
  "username": "Putin"  
}  
```  
  
### `DELETE /api/carts/{id}/`  
Удаление пользователя по его ID.  