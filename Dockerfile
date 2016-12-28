FROM python:2.7.12-alpine

MAINTAINER Siert Zijl <siert@oblcc.com>

RUN layer=awscli \
  pip install --upgrade \
    awscli \
    boto \
    boto3 \
    botocore

RUN layer=ansible \
  apk add --no-cache \
    build-base \
    libffi-dev \
    openssl-dev \
    && pip install --upgrade \
       ansible==2.2.0.0 \
    && \
      apk del --no-cache build-base \
      libffi-dev \
      openssl-dev

