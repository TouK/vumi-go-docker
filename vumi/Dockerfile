FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y protobuf-compiler python-dev build-essential python-pip libffi-dev libpq-dev git postgresql-client

RUN git clone https://github.com/praekelt/vumi-go.git

WORKDIR /vumi-go

RUN pip install virtualenv
RUN virtualenv --no-site-packages ve
RUN /bin/bash -c "source ve/bin/activate"
RUN pip install -r requirements.pip
RUN pip install -r requirements-dev.pip

ADD . /tmp/scripts
RUN patch -p1 < /tmp/scripts/settings.patch

ENTRYPOINT /tmp/scripts/entrypoint.sh
