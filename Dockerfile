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

RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.zshrc
RUN ["/bin/zsh", "-c", "source ~/.zshrc"]

RUN ["/bin/zsh", "-c", "~/.pyenv/bin/pyenv install 3.4.3"]
RUN ["/bin/zsh", "-c", "~/.pyenv/bin/pyenv global 3.4.3"]
RUN ["/bin/zsh", "-c", "~/.pyenv/bin/pyenv rehash"]

ENTRYPOINT ["zsh"]