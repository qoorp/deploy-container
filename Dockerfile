FROM node:13-alpine

ENV GCLOUD_VERSION 289.0.0

RUN apk --no-cache --no-progress upgrade
RUN apk add --no-progress --no-cache git bash openssh docker python2 openssl wget nodejs ca-certificates
RUN mkdir -p /opt \
  && wget -nv -P /opt https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$GCLOUD_VERSION-linux-x86_64.tar.gz \
  && tar -x -C /opt -f /opt/google-cloud-sdk-$GCLOUD_VERSION-linux-x86_64.tar.gz \
  && rm -rf /opt/google-cloud-sdk-$GCLOUD_VERSION-linux-x86_64.tar.gz \
  && /opt/google-cloud-sdk/bin/gcloud --quiet components update --version $GCLOUD_VERSION kubectl
