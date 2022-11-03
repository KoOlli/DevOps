FROM nginx

COPY ./miniserver.c /
COPY ./nginx.conf  /bin/nginx/
COPY ./run.sh /

RUN apt update &&\
    apt install -y gcc spawn-fcgi libfcgi-dev &&\
    gcc /miniserver.c -lfcgi -o /miniserver.fcgi &&\
    chmod +x /run.sh

ENTRYPOINT [ "/run.sh" ]