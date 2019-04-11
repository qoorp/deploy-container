FROM alpine:3.9

RUN apk add --no-progress --no-cache git bash openssh docker python2 openssl wget nodejs

RUN  mkdir -p /opt && wget -P /opt https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-184.0.0-linux-x86_64.tar.gz \
  && tar -x -C /opt -f /opt/google-cloud-sdk-184.0.0-linux-x86_64.tar.gz \
  && /opt/google-cloud-sdk/bin/gcloud --quiet components update --version 184.0.0 kubectl
