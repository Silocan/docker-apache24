FROM debian:latest
MAINTAINER Nicolas FATREZ <docker@fatrez.com>

ENV APP_ENV development
ENV WWW /var/www/html
ENV PORT 80
ENV VHOST localhost.dev

RUN apt-get update && apt-get -y upgrade;
RUN apt-get -y install wget nano;
RUN apt-get -y install apache2;
RUN apt-get -y install php5 libapache2-mod-php5;
RUN apt-get -y install php5-mysqlnd php5-curl php5-gd php-pear php5-imagick php5-imap php5-mcrypt php5-xmlrpc php5-xsl;

VOLUME /var/www/html
VOLUME /etc/apache2/sites-enabled

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf 
COPY conf/template.conf /tmp
COPY run.sh /tmp

CMD /bin/sh /tmp/run.sh
