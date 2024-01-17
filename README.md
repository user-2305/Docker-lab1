# Docker-lab1

Выполните оптимизацию образа за счет применения легковесного базового образа, уменьшения количества слоев и др.:

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
