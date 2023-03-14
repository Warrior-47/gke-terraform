FROM amazonlinux

RUN yum update -y

RUN yum install httpd -y

WORKDIR /var/www/html

COPY . .

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 8081