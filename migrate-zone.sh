#!/bin/bash

AWS_DEFAULT_PROFILE=iteg
ZONES=$(aws route53 list-hosted-zones --query HostedZones[].Id --out text)
for zone in $ZONES
  do echo === $zone ===
  aws route53 get-hosted-zone --id Z3Q4R5UQ5GPPHO --query DelegationSet.NameServers[] --out table
  aws route53 list-resource-record-sets --hosted-zone-id $zone --query ResourceRecordSets[].[Type,Name] --out text
done
