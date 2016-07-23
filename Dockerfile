FROM centos:7
MAINTAINER MasahiroSaito (m411momo)

<<<<<<< HEAD
# パッケージ関連
RUN yum update -y && yum install -y \
wget zsh vim net-tools \
git gcc gcc-c++ make \
bzip2 bzip2-devel \
openssl openssl-devel \
readline readline-devel \
zlib zlib-devel \
sqlite sqlite-devel

# ZSH設定ダウンロード
RUN wget -P ~ https://raw.githubusercontent.com/MasahiroSaito/docker-mycentos/master/.zshrc && chsh -s /bin/zsh
=======
RUN yum update -y && yum install -y \
wget \
zsh \
vim \
net-tools \
git \
gcc \
zlib \
zlib-devel \
bzip2 \
bzip2-devel \
readline \
readline-devel \
sqlite \
sqlite-devel \
openssl \
openssl-devel

RUN wget -P ~ https://raw.githubusercontent.com/MasahiroSaito/docker-mycentos/master/.zshrc && chsh -s /bin/zsh

RUN \
git clone https://github.com/yyuu/pyenv.git ~/.pyenv && \
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc && \
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc && \
echo 'eval "$(pyenv init -)"' >> ~/.zshrc && \
/bin/zsh -c "source ~/.zshrc && \
~/.pyenv/bin/pyenv install 3.4.3 && \
~/.pyenv/bin/pyenv global 3.4.3 && \
~/.pyenv/bin/pyenv rehash && \
pip install --upgrade pip && \
pip install slackbot"
>>>>>>> f325df7627457b2ad12ad6528a96cddf00321684

ENTRYPOINT ["zsh"]