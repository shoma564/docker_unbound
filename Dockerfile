FROM almalinux:latest
RUN yum -y update && yum -y install unbound
ADD unbound.conf /etc/unbound/
ENV TZ=Asia/Tokyo
ADD docker-log /etc/logrotate.d/


RUN mkdir -p /etc/unbound/log/
RUN chmod 777 /etc/unbound/log/ && \
chown unbound:unbound /etc/unbound/log/ && \
touch /etc/unbound/log/unbound.log && \
chmod 777 /etc/unbound/log/unbound.log && \
chown unbound:unbound /etc/unbound/log/unbound.log && \
chmod 644 /etc/logrotate.d/*




ENTRYPOINT ["/usr/sbin/unbound","-d","-c","/etc/unbound/unbound.conf"]
