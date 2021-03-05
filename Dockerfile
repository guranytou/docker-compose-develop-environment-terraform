FROM golang:1.16.0-alpine3.13

ARG GLIBC_VER=2.31-r0
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_REGION

RUN apk update --no-cache \
    && apk add --no-cache \
        unzip \
        curl \
        git \
        bash \
        binutils \
        make

# install tfenv
RUN git clone https://github.com/tfutils/tfenv.git /home/.tfenv
ENV PATH $PATH:/home/.tfenv/bin
RUN tfenv install 0.14.5 \
    && tfenv install 0.13.6 \
    && tfenv install 0.12.30 \
    && tfenv use 0.14.5

# install glibc
RUN curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk \
    && apk add --no-cache glibc-${GLIBC_VER}.apk glibc-bin-${GLIBC_VER}.apk

# install awscliv2
RUN curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
    && unzip -q awscliv2.zip
RUN aws/install

# install tfmigrate
RUN git clone https://github.com/minamijoyo/tfmigrate
WORKDIR tfmigrate
RUN make install

RUN mkdir /root/.aws/

WORKDIR /terraform

COPY ./docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "/bin/bash" ]