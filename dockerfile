FROM nginx:latest

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

COPY index.html /var/www/my_project/
COPY img.jpg /var/www/my_project/img/

RUN chown -R nginx:nginx /var/www/my_project

USER nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon on;"]