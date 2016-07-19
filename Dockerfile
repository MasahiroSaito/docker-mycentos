FROM centos:7
MAINTAINER MasahiroSaito (m411momo)

RUN \
yum update -y && \
yum install -y wget && \
yum install -y zsh && \
yum install -y vim && \
yum install -y net-tools && \
yum install -y git

RUN wget -P ~ https://raw.githubusercontent.com/MasahiroSaito/docker-mycentos/master/.zshrc
RUN chsh -s /bin/zsh

ENTRYPOINT ["zsh"]