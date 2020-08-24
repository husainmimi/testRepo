FROM centos:7

RUN yum install at  yum-utils -y
RUN yum-config-manager --add-repo  http://172.17.0.2:8899/taskRepo.repo
RUN yum-config-manager --disable \* 
RUN yum-config-manager --enable taskRepoServerSide
RUN mkdir scripts

COPY clientSide/scripts/. /scripts

CMD  atd; at now + 2 minute -f /scripts/installHttpd.sh; bash
