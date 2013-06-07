#! /bin/bash

#test aws install tools 

ec2-describe-regions
ec2-ami-tools-version
iam-accountgetsummary
rds-describe-db-engine-versions
elb-describe-lb-policies
cfn-list-stacks
cs-describe-domain
mon-version
elasticache-describe-cache-clusters
eb --version
elastic-mapreduce --list --all
sns-list-topics
dnscurl.pl --keyname default https://route53.amazonaws.com/2010-10-01/hostedzone | xmllint --format -
cfcurl.pl --keyname default https://cloudfront.amazonaws.com/2008-06-30/distribution | xmllint --format -
s3curl.pl --id default http://s3.amazonaws.com/ | xmllint --format -
datapipeline  --list-pipelines