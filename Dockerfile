FROM debian:buster

RUN apt-get update \
&& apt-get install -y python2.7 python3 python3-pip

ADD . /opt/graylog2thehive4

WORKDIR /opt/graylog2thehive4

RUN /usr/bin/pip3 install --upgrade pip
RUN /usr/bin/pip3 install -r ./requirements.txt

# Fix libmagic bug
#RUN pip uninstall -y python-magic && pip install python-magic

EXPOSE 5000

CMD /usr/bin/python3 /opt/graylog2thehive4/graylog2thehive4.py
