FROM nginx:1.17.3

ARG VERSION=latest

WORKDIR /usr/share/nginx/html

COPY . .

RUN    chmod -R 755 /usr/share/nginx/html \
    && chown -R nginx:nginx /usr/share/nginx/html \
    && sed -i -e "s/VERSION/${VERSION}/g" /usr/share/nginx/html/index.html

COPY conf/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443
