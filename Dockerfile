FROM python:2.7.12-alpine

MAINTAINER Siert Zijl <siert@oblcc.com>

ENV AWSCLI_VERSION=1.11.34
ENV ANSIBLE_VERSION=2.2.0.0

RUN layer=awscli \
  pip install --upgrade \
    awscli==1.11.34 \
    boto \
    boto3 \
    botocore

RUN layer=ansible \
  apk add --no-cache --virtual .build-deps \
    build-base \
    libffi-dev \
    openssl-dev \
    && pip install --upgrade \
       ansible==${ANSIBLE_VERSION} \
    && \
      apk del .build-deps

