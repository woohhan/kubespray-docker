FROM python:3.7.7-alpine3.11

ENV KUBESPRAY_VERSION release-2.12

RUN apk --update --no-cache --update-cache --virtual .build-deps add git gcc make musl-dev libffi-dev openssl-dev && \
    git clone -b $KUBESPRAY_VERSION --single-branch --depth 1 https://github.com/kubernetes-sigs/kubespray.git && \
    pip3 install -r kubespray/requirements.txt && \
    apk del .build-deps

WORKDIR kubespray
