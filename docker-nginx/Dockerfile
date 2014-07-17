FROM dockerfile/python

RUN pip install awscli
ADD https://raw.githubusercontent.com/sequenceiq/route53/master/create-aname.sh /tmp/ && chmod +x /tmp/create-aname.sh

WORKDIR /usr/share/nginx/
