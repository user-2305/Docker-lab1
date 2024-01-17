# Docker-lab1

Для выполнения задания, мы создадим Dockerfile и необходимые файлы в директории, а затем загрузим образ в Docker Hub.

1. Выберите базовый образ:

```Dockerfile
FROM alpine:latest
```

2. Обновление apt-кеша:

```Dockerfile
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*
```

3. Обновить все пакеты в контейнере:

```Dockerfile
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*
```

4. Установить веб сервер nginx:

```Dockerfile
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*
```

5. Очистить скачанный apt-cache:

```Dockerfile
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*
```

6. Удалить содержимое директории /var/www/:

```Dockerfile
RUN rm -rf /var/www/*
```

7. Создать в директории /var/www/ директорию с именем вашего сайта и папку с картинками:

```Dockerfile
RUN mkdir -p /var/www/my_project/img
```

8. Поместить из папки с докер файлом в директорию /var/www/ my_project файл index.html:

```Dockerfile
COPY index.html /var/www/my_project/
```

9. Поместить из папки с докер файлом в директорию /var/www/my_project/img файл img.jpg:

```Dockerfile
COPY img.jpg /var/www/my_project/img/
```

10. Задать рекурсивно на папку /var/www/my_project права "владельцу - читать, писать, исполнять; группе - читать, исполнять, остальным - читать, исполнять":

```Dockerfile
RUN chown -R www-data:www-data /var/www/my_project && chmod -R 755 /var/www/my_project
```

11. Создать пользователя <ваше имя>:

```Dockerfile
RUN useradd -m myuser
```

12. Создать группу <ваше имя>:

```Dockerfile
RUN groupadd mygroup
```

13. С помощью команды usermod поместить пользователя <ваше имя> в группу <ваше имя>:

```Dockerfile
RUN usermod -aG mygroup myuser
```

14. Рекурсивно присвоить созданных пользователя и группу на папку /var/www/my_project:

```Dockerfile
RUN chown -R myuser:mygroup /var/www/my_project && chmod -R 755 /var/www/my_project
```

15. Заменить в файле /etc/nginx/sites-enabled/default (/var/www/html) на (/var/www/my_project):

```Dockerfile
RUN sed -i 's/^server_name _;/server_name my_project;/' /etc/nginx/sites-enabled/default
```

16. С помощью команды grep найти в каком файле задается пользователь (user), от которого запускается nginx:

```bash
grep 'user' /etc/nginx/nginx.conf
```

17. С помощью команды sed проделать операцию замены пользователя в файле, найденном в пункте 16 на вашего пользователя:

```Dockerfile
RUN sed -i 's/www-data/myuser/g' /etc/nginx/nginx.conf'
```

18. Соберите ваш контейнер:

```bash
docker build -t my_progect .
```

19. Проведите тест nginx командой nginx -t:

```bash
docker run -ti -p 80:80 my_progect
```

20. Определите порт подключения:

```bash
docker run -ti -p 80:80 my_progect
```

21. Задайте в команды запуска веб-сервера:

```Dockerfile
CMD ["nginx", "-g", "daemon off;"]
```

22. Запустить ваш контейнер, но на этот раз передав аргументами нужные порты:

```bash
docker run -ti -p 80:80 test
```

23. Откройте в браузере 127.0.0.1:80. Вы должны получить вашу приветственную страницу. Сделайте скриншот страницы в браузере на фоне команды запуска контейнера. Скриншот положить в репозиторий:

```bash
docker run -ti -p 80:80 test
```

24. Выполните оптимизацию образа за счет применения легковесного базового образа, уменьшения количества слоев и др.:

```Dockerfile
FROM alpine:latest
WORKDIR /run/nginx
RUN apk add --no-cache nginx
RUN chown -R nginx:nginx /var/lib/nginx
COPY default.conf /etc/nginx/http.d
COPY index.html /var/lib/nginx/html
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
```

25. Выполните правильную постановку тега и загрузите ваш контейнер в docker hub:

```bash
docker tag test user2305/test
docker login
docker push user2305/my_progect
```
