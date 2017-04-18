FROM alpine:latest
MAINTAINER scakkia <scakkia@gmail.com>
RUN apk add --update --no-cache --virtual build-dependencies \
    python3 openssh-client git rsync openssl ca-certificates  python3-dev libffi-dev openssl-dev build-base && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade cffi && \
    pip3 install --upgrade ansible Jinja2 ansible-lint && \
    pip3 install --upgrade awscli boto3 ec2 && \
    pip3 install --upgrade pyvmomi pysphere && \
    pip3 install --upgrade dopy && \
    pip3 install --upgrade docker-py && \
    rm -r /root/.cache && \
    export PATH=~/.local/bin:$PATH

ENV PATH /root/.local/bin:$PATH
ENTRYPOINT ["ansible-playbook"]
VOLUME ["/etc/ansible", "/root/.aws", "/root/.ssh", "/var/run/docker.sock", "/root/.ssh", "/root/vault-pass.txt"]
WORKDIR /etc/ansible
