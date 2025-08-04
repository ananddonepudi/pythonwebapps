FROM centos

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*


RUN yum -y install httpd
# Installing Unzip
RUN yum -y install -yqq unzip

ENV HTML beginner-html-site-styled
ADD https://github.com/mdn/$HTML/archive/refs/heads/gh-pages.zip /var/www/html/code.zip

RUN  cd  /var/www/html/ && unzip code.zip &&  mv  /var/www/html/$HTML-gh-pages/*  /var/www/html

CMD apachectl -DFOREGROUND