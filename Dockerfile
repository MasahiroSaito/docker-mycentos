FROM centos:7
MAINTAINER MasahiroSaito

RUN \
yum update -y && \
yum install -y wget && \
yum install -y zsh

RUN wget -P ~ https://gist.githubusercontent.com/MasahiroSaito/0d09b7625d2d75a1e56682ade6b5a4b2/raw/b103012d5cac4c37f9ce5679b937d0ff42055025/.zshrc

RUN chsh -s /bin/zsh

CMD zsh