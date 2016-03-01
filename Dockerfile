FROM armbuild/alpine:3.3

MAINTAINER Vincent Palmer <shift@someone.section.me>

RUN apk add --update linux-headers gcc openssl-dev musl-dev libffi-dev python-dev py-pip \
  && pip install --no-cache-dir letsencrypt \
  && apk info | grep dev | xargs apk del \
  && apk del scanelf gcc expat pkgconf pkgconfig \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["letsencrypt"]
