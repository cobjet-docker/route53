ZONE=octopress.me
ZONE_REF=$ZONE_$(date +%Y%m%d-%H%M)

aws route53 create-hosted-zone --name $ZONE --caller-reference $ZONE_REF
