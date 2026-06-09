FROM nginx:1.31.1-trixie

COPY logrotate.conf /etc/logrotate.d/nginx
RUN apt update && apt install -y logrotate

RUN apt clean

COPY backend.conf.template /tmp/backend.conf.template

EXPOSE 8080

VOLUME ["/var/log/ngnix"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]