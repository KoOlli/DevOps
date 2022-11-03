FROM nginx

COPY ./nginx.conf /etc/nginx/

RUN apt-get update &&\
  apt-get install -y gcc spawn-fcgi libfcgi-dev &&\
  rm -rf /var/lib/apt/lists/* &&\
  chown -R nginx:nginx /var/cache/nginx/ &&\
  chown -R nginx:nginx /var/run/ &&\
  chmod g-s \
  /usr/bin/wall \
  /sbin/unix_chkpwd \
  /usr/bin/expiry \
  /usr/bin/chage &&\
  chmod u-s \
  /bin/umount \
  /usr/bin/passwd \
  /bin/mount \
  /bin/su \
  /usr/bin/newgrp \
  /usr/bin/gpasswd \
  /usr/bin/chsh \
  /usr/bin/chfn

USER nginx

HEALTHCHECK CMD curl -sS 127.0.0.1 || exit 1
