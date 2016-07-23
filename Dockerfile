FROM centos:7
MAINTAINER MasahiroSaito (m411momo)

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

ENTRYPOINT ["zsh"]