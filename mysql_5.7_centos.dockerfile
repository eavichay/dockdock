# mysql on centos

FROM centos:7

MAINTAINER "Avichay Eyal" <eavichay@gmail.com>

RUN yum install -y epel-release\
 which\
 sudo\
 zlib-devel\
 curl\
 wget\
 bzip2\
 curl\
 gcc\
 gcc-c++\
 make\
 automake\
 libtool\
 python-devel\
 python-pip
 
RUN easy_install supervisor
 
RUN cd /tmp\
 && wget http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm\
 && localinstall -y mysql57-community-release-el7-7.noarch.rpm\
 && yum install -y mysql-community-client mysql-community-server\
 && rm mysql57-community-release-el7-7.noarch.rpm
 
ADD my_5.7.cnf /etc/my.cnf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 3306

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
