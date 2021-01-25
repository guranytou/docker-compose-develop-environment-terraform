FROM alpine:latest

RUN apk update --no-cache \
    && apk add --no-cache \
        wget \
        unzip \
        curl \
        git \
        bash
RUN git clone https://github.com/tfutils/tfenv.git /home/.tfenv
ENV PATH $PATH:/home/.tfenv/bin
RUN echo $PATH
RUN tfenv install 0.14.5 \ 
    && tfenv install 0.13.6 \
    && tfenv install 0.12.30
RUN tfenv use 0.14.5