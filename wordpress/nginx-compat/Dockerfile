FROM nginx:1.25.3-bookworm AS build

# Custom configuration files, including using a single process for Nginx
COPY ./rootfs/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./rootfs/etc/nginx/fastcgi_params /etc/nginx/fastcgi_params

RUN rm /var/log/nginx/error.log
RUN rm /var/log/nginx/access.log
RUN touch /var/log/nginx/error.log
RUN touch /var/log/nginx/access.log
