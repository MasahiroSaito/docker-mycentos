FROM centos:7
MAINTAINER MasahiroSaito (m411momo)

SHELL ["/bin/bash", "-c"]

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

# RUN wget -P ~ https://raw.githubusercontent.com/MasahiroSaito/docker-mycentos/master/.zshrc
# RUN chsh -s /bin/zsh

RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv && \
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile && \
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile && \
RUN echo 'eval "$(pyenv init -)"' >> ~/.bash_profile && \
RUN source ~/.bash_profile

RUN pyenv install 3.4.3
RUN pyenv global 3.4.3
RUN pyenv rehash

# ENTRYPOINT ["bash"]