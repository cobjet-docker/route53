FROM dockerfile/python

RUN pip install awscli
ADD https://raw.githubusercontent.com/sequenceiq/route53/master/create-aname.sh /tmp/ && chmod +x /tmp/create-aname.sh

VOLUME  /usr/share/nginx/:/usr/share/nginx/
VOLUME /etc/nginx/:/etc/nginx/

WORKDIR /usr/share/nginx/
