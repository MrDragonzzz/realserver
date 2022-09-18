FROM centos:7
LABEL ljy="571646321@qq.com"
ADD node-v16.17.0-linux-x64.tar.gz /usr/local/
COPY Conduit_NodeJS/ /usr/local/conduit/
RUN yum -y update; yum clean all

RUN yum -y install epel-release; yum clean all

RUN yum -y install nodejs npm; yum clean all

ENV NODE_HOME /usr/local/node-v16.17.0-linux-x64
ENV PATH=$PATH:NODE_HOME/bin

ENV NODE_PATH $NODE_HOME/lib/node_modules
ENV USER_NAME root
ENV PASSWORD 030815
ENV DB_HOST localhost

EXPOSE 3310
WORKDIR /usr/local/conduit/
RUN npm install
CMD npm start
