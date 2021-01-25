FROM alpine:latest

ARG GLIBC_VER=2.31-r0

RUN apk update --no-cache \
    && apk add --no-cache \
        wget \
        unzip \
        curl \
        git \
        bash \
        binutils

# install tfenv
RUN git clone https://github.com/tfutils/tfenv.git /home/.tfenv
ENV PATH $PATH:/home/.tfenv/bin
RUN echo $PATH
RUN tfenv install 0.14.5 \ 
    && tfenv install 0.13.6 \
    && tfenv install 0.12.30
RUN tfenv use 0.14.5

# install glibc
RUN curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub
RUN curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk
RUN curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk
RUN apk add --no-cache glibc-${GLIBC_VER}.apk glibc-bin-${GLIBC_VER}.apk

# install awscliv2
RUN curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
RUN unzip -q awscliv2.zip
RUN aws/install