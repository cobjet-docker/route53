#!/bin/bash

PROG=$(basename $0)
if [ $# -lt 2 ] ; then
cat <<EOD
usage: $PROG <SUBDOMAIN> <TARGET_IP>
  creates ANAME dns entry in asw route53

example: $PROG dev 54.72.21.93
  dev.sequenceiq.com => 54.72.21.93

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
        "Type": "A",
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
