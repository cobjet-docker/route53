#!/bin/bash

PROG=$(basename $0)
if [ $# -lt 2 ] ; then
cat <<EOD
usage: $PROG <SUBDOMAIN> <TARGET_URL>
  creates CNAME dns entry in asw route53

example: $PROG maven seq-repo.s3.amazonaws.com
  maven.sequenceiq.com => seq-repo.s3.amazonaws.com

EOD
  exit -1
fi

SUBDOMAIN=${1:? "subdomain is missing"}
TARGET=${2:? "target is missing"}

DNS_RECORD=$(cat <<EOF
{
  "Changes": [
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "$SUBDOMAIN.sequenceiq.com.",
        "Type": "CNAME",
        "TTL": 300,
        "ResourceRecords": [
          {
            "Value": "$TARGET"
          }
        ]
      }
    }
  ]
}
EOF
)


aws route53 change-resource-record-sets --hosted-zone-id "/hostedzone/ZM3N9EMI8XJSW" --change-batch "$DNS_RECORD"

: <<EOF
if error msg: "but it already exists"
replace CREATE with UPSERT
EOF
