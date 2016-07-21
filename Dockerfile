FROM centos:7
MAINTAINER MasahiroSaito (m411momo)

RUN yum update -y

RUN yum install -y \
wget \
zsh \
vim \
net-tools \
git \
gcc \
zlib-devel \
bzip2 \
bzip2-devel \
readline \
readline-devel \
sqlite \
sqlite-devel \
openssl \
openssl-devel

RUN wget -P ~ https://raw.githubusercontent.com/MasahiroSaito/docker-mycentos/master/.zshrc
RUN chsh -s /bin/zsh
RUN zsh

RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv && \
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc && \
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc && \
echo 'eval "$(pyenv init -)"' >> ~/.zshrc && \
source ~/.zshrc

RUN \
pyenv install 3.4.3 && \
pyenv global 3.4.3 && \
pyenv rehash

ENTRYPOINT ["zsh"]