FROM centos:7

RUN cd /
RUN mkdir myRepo
RUN cd myRepo
RUN repotrack -p /myRepo httpd
RUN yum install  createrepo httpd  -y
COPY serverSide/taskRepo.repo /etc/yum.repos.d
RUN createrepo /myRepo
RUN yum clean all

COPY serverSide/httpd.conf /etc/httpd/conf

RUN ln -s /myRepo /var/www/html/myRepo
RUN ln -s /etc/yum.repos.d/taskRepo.repo  /var/www/html/taskRepo.repo
CMD httpd; bash
