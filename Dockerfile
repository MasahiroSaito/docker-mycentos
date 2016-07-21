FROM centos:7
MAINTAINER MasahiroSaito (m411momo)

RUN \
yum update -y && \
yum install -y wget && \
yum install -y zsh && \
yum install -y vim && \
yum install -y net-tools && \
yum install -y git && \
yum install -y gcc &&\
yum install -y zlib-devel &&\
yum install -y bzip2 &&\
yum install -y bzip2-devel &&\
yum install -y readline-devel &&\
yum install -y sqlite-devel &&\
yum install -y openssl &&\
yum install -y openssl-devel

RUN wget -P ~ https://raw.githubusercontent.com/MasahiroSaito/docker-mycentos/master/.zshrc
RUN chsh -s /bin/zsh

RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv && \
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile && \
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile && \
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile && \
source ~/.bash_profile

RUN \
pyenv install 3.4.3 && \
pyenv global 3.4.3 && \
pyenv rehash

ENTRYPOINT ["zsh"]