FROM nginx:1.15.7-alpine

RUN mkdir -p /data/myadmin-lite-master

WORKDIR /root

COPY ./ /data/myadmin-lite-master

EXPOSE 80


RUN  cp /data/myadmin-lite-master/nginx.conf /etc/nginx/nginx.conf
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone


RUN echo '/usr/sbin/nginx -g "daemon off;"' > /root/uwsgi.sh
CMD sh /root/uwsgi.sh