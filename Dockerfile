FROM arm64v8/alpine:3.10
LABEL maintainer="scakkia@gmail.com"
RUN apk add --update --no-cache --virtual build-dependencies \
    python openssh-client git rsync openssl ca-certificates python-dev libffi-dev openssl-dev build-base && \
    python -m ensurepip && \
    pip install --upgrade pip && \
    rm -r /usr/lib/python*/ensurepip

# to run ansible 2.6.4 we must to pin the packeges version
RUN pip install --upgrade cryptography==2.3.1 cffi==1.11.5 ansible==2.6.4 Jinja2==2.10 ansible-lint==3.4.23
# RUN pip install --upgrade cffi==1.11.5
# RUN pip install --upgrade ansible==2.6.4
# RUN pip install --upgrade Jinja2==2.10 
# RUN pip install --upgrade ansible-lint==3.4.23

RUN pip install --upgrade awscli boto3 ec2 && \
    pip install --upgrade pyvmomi pysphere && \
    pip install --upgrade dopy && \
    pip install --upgrade docker-py && \
    rm -r /root/.cache && \
    export PATH=~/.local/bin:$PATH

ENV PATH /root/.local/bin:$PATH
ENTRYPOINT ["ansible-playbook"]
VOLUME ["/etc/ansible", "/root/.aws", "/root/.ssh", "/var/run/docker.sock", "/root/.ssh", "/root/vault-pass.txt"]
WORKDIR /etc/ansible
