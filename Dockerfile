FROM alpine:3.6

COPY ./pks /usr/local/bin/pks

RUN apk --no-cache --update add bash curl less groff jq python py-pip openssh-client && \
  pip install --no-cache-dir --upgrade pip && \
  pip install --no-cache-dir awscli==1.11.167 s3cmd==2.0.0 https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-1.4-24.tar.gz && \
  mkdir /root/.aws && \
  aws --version && \
  s3cmd --version

RUN curl -L -O https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-5.4.0-linux-amd64 && \
    mv bosh-cli-* /usr/local/bin/bosh && \
    curl -L -O https://github.com/pivotal-cf/om/releases/download/0.53.0/om-linux && \
    mv om-linux /usr/local/bin/om && \
    curl -L -O https://github.com/pivotal-cf/pivnet-cli/releases/download/v0.0.55/pivnet-linux-amd64-0.0.55 && \
    mv pivnet-linux* /usr/local/bin/pivnet &&  \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    mv kubectl /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/bosh && \
    chmod +x /usr/local/bin/om && \
    chmod +x /usr/local/bin/pivnet &&\
    chmod +x /usr/local/bin/kubectl &&\
    chmod +x /usr/local/bin/pks


ENTRYPOINT []
