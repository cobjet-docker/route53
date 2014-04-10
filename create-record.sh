
DNS_RECORD=$(cat <<EOF
{
  "Changes": [
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "maven.sequenceiq.com.",
        "Type": "CNAME",
        "TTL": 300,
        "ResourceRecords": [
          {
            "Value": "seq-repo.s3.amazonaws.com"
          }
        ]
      }
    }
  ]
}
EOF
)


aws route53 change-resource-record-sets --hosted-zone-id "/hostedzone/ZM3N9EMI8XJSW" --change-batch "$DNS_RECORD"
