#! /bin/bash
##Install deps for debian/ubuntu
sudo apt-get update
sudo apt-get install -y openjdk-6-jre ruby1.8-full rubygems libxml2-utils libxml2-dev libxslt-dev unzip cpanminus build-essential cpanminus

##Install ruby deps
sudo gem install uuidtools json httparty nokogiri


##make dir install tools 
sudo mkdir -p /usr/local/aws

##EC2 API command line tools
wget --quiet http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
unzip -qq ec2-api-tools.zip
sudo rsync -a --no-o --no-g ec2-api-tools-*/ /usr/local/aws/ec2/

##EC2 AMI command line tools
wget --quiet http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip
unzip -qq ec2-ami-tools.zip
sudo rsync -a --no-o --no-g ec2-ami-tools-*/ /usr/local/aws/ec2/

##IAM (Identity and Access Management) commmand line tools
wget --quiet http://awsiammedia.s3.amazonaws.com/public/tools/cli/latest/IAMCli.zip
unzip -qq IAMCli.zip
sudo rsync -a --no-o --no-g IAMCli-*/ /usr/local/aws/iam/

##RDS (Relational Database Service) command line tools

wget --quiet http://s3.amazonaws.com/rds-downloads/RDSCli.zip
unzip -qq RDSCli.zip
sudo rsync -a --no-o --no-g RDSCli-*/ /usr/local/aws/rds/

##ELB (Elastic Load Balancer) command line tools

wget --quiet http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip
unzip -qq ElasticLoadBalancing.zip
sudo rsync -a --no-o --no-g ElasticLoadBalancing-*/ /usr/local/aws/elb/

##AWS CloudFormation command line tools

wget --quiet https://s3.amazonaws.com/cloudformation-cli/AWSCloudFormation-cli.zip
unzip -qq AWSCloudFormation-cli.zip
sudo rsync -a --no-o --no-g AWSCloudFormation-*/ /usr/local/aws/cfn/

##Auto Scaling command line tools

wget --quiet http://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip
unzip -qq AutoScaling-*.zip
sudo rsync -a --no-o --no-g AutoScaling-*/ /usr/local/aws/as/


##AWS Import/Export command line tools

wget --quiet http://awsimportexport.s3.amazonaws.com/importexport-webservice-tool.zip
sudo mkdir /usr/local/aws/importexport
sudo unzip -qq importexport-webservice-tool.zip -d /usr/local/aws/importexport

##CloudSearch command line tools

wget --quiet http://s3.amazonaws.com/amazon-cloudsearch-data/cloud-search-tools-1.0.0.1-2012.03.05.tar.gz
tar xzf cloud-search-tools*.tar.gz
sudo rsync -a --no-o --no-g cloud-search-tools-*/ /usr/local/aws/cloudsearch/

##CloudWatch command line tools

wget --quiet http://ec2-downloads.s3.amazonaws.com/CloudWatch-2010-08-01.zip
unzip -qq CloudWatch-*.zip
sudo rsync -a --no-o --no-g CloudWatch-*/ /usr/local/aws/cloudwatch/

##ElastiCache command line tools

wget --quiet https://s3.amazonaws.com/elasticache-downloads/AmazonElastiCacheCli-2012-03-09-1.6.001.zip
unzip -qq AmazonElastiCacheCli-*.zip
sudo rsync -a --no-o --no-g AmazonElastiCacheCli-*/ /usr/local/aws/elasticache/

##Elastic Beanstalk command line tools

wget --quiet https://s3.amazonaws.com/elasticbeanstalk/cli/AWS-ElasticBeanstalk-CLI-2.1.zip
unzip -qq AWS-ElasticBeanstalk-CLI-*.zip
sudo rsync -a --no-o --no-g AWS-ElasticBeanstalk-CLI-*/ /usr/local/aws/elasticbeanstalk/

##Elastic MapReduce command line tools

wget --quiet http://elasticmapreduce.s3.amazonaws.com/elastic-mapreduce-ruby.zip
unzip -qq -d elastic-mapreduce-ruby elastic-mapreduce-ruby.zip
sudo rsync -a --no-o --no-g elastic-mapreduce-ruby/ /usr/local/aws/elasticmapreduce/

##Simple Notification Serivice (SNS) command line tools

wget --quiet http://sns-public-resources.s3.amazonaws.com/SimpleNotificationServiceCli-2010-03-31.zip
unzip -qq SimpleNotificationServiceCli-*.zip
sudo rsync -a --no-o --no-g SimpleNotificationServiceCli-*/ /usr/local/aws/sns/
sudo chmod 755 /usr/local/aws/sns/bin/*

##Route 53 (DNS) command line tools

sudo mkdir -p /usr/local/aws/route53/bin
for i in dnscurl.pl route53tobind.pl bindtoroute53.pl route53zone.pl; do
  sudo wget --quiet --directory-prefix=/usr/local/aws/route53/bin      http://awsmedia.s3.amazonaws.com/catalog/attachments/$i
  sudo chmod +x /usr/local/aws/route53/bin/$i
done
cpanm --sudo --notest --quiet Net::DNS::ZoneFile NetAddr::IP   Net::DNS Net::IP Digest::HMAC Digest::SHA1 Digest::MD5

##CloudFront command line tool

sudo wget --quiet --directory-prefix=/usr/local/aws/cloudfront/bin   http://d1nqj4pxyrfw2.cloudfront.net/cfcurl.pl
sudo chmod +x /usr/local/aws/cloudfront/bin/cfcurl.pl

##S3 command line tools

wget --quiet http://s3.amazonaws.com/doc/s3-example-code/s3-curl.zip
unzip -qq s3-curl.zip
sudo mkdir -p /usr/local/aws/s3/bin/
sudo rsync -a --no-o --no-g s3-curl/ /usr/local/aws/s3/bin/
sudo chmod 755 /usr/local/aws/s3/bin/s3curl.pl

##AWS Data Pipeline command line tools:

wget --quiet https://s3.amazonaws.com/datapipeline-us-east-1/software/latest/DataPipelineCLI/datapipeline-cli.zip
unzip -qq datapipeline-cli.zip
sudo rsync -a --no-o --no-g datapipeline-cli/ /usr/local/aws/datapipeline/


#Setup Aws Credentials and Env


mkdir -m 0700 $HOME/.aws-default/

cp $HOME/.aws-default/
cp 

touch $HOME/.aws-default/aws-credential-file.txt

echo "AWSAccessKeyId=<insert your AWS access id here>
AWSSecretKey=<insert your AWS secret access key here>" >> $HOME/.aws-default/aws-credential-file.txt

touch $HOME/.aws-default/aws-credentials.json


read -d '' creds <<- EOF

"access-id": "<insert your AWS access id here>",
"private-key": "<insert your AWS secret access key here>",
"key-pair": "<insert the name of your Amazon ec2 key-pair here>",
"key-pair-file": "<insert the path to the .pem file for your Amazon ec2 key pair here>",
"region": "<The region where you wish to launch your job flows. Should be one of us-east-1, us-west-1, us-west-2, eu-west-1, ap-southeast-1, or ap-northeast-1, sa-east-1>", 
  "use-ssl": "true",
  "log-uri": "s3://yourbucket/datapipelinelogs"

EOF 
echo "$creds" >> $HOME/.aws-default/aws-credentials.json

touch $HOME/.aws-secrets

read -d '' secrets <<- EOF

 %awsSecretAccessKeys = (
  'default' => {
    id => '<insert your AWS access id here>',
    key => '<insert your AWS secret access key here>',
  },
);
EOF

echo "$secrets" >> $HOME/.aws-secrets

ln -s $HOME/.aws-secrets $HOME/.s3curl
chmod 600 $HOME/.aws-default/* $HOME/.aws-secrets

#Export needs

export JAVA_HOME=/usr
export EC2_HOME=/usr/local/aws/ec2
export AWS_IAM_HOME=/usr/local/aws/iam
export AWS_RDS_HOME=/usr/local/aws/rds
export AWS_ELB_HOME=/usr/local/aws/elb
export AWS_CLOUDFORMATION_HOME=/usr/local/aws/cfn
export AWS_AUTO_SCALING_HOME=/usr/local/aws/as
export CS_HOME=/usr/local/aws/cloudsearch
export AWS_CLOUDWATCH_HOME=/usr/local/aws/cloudwatch
export AWS_ELASTICACHE_HOME=/usr/local/aws/elasticache
export AWS_SNS_HOME=/usr/local/aws/sns
export AWS_ROUTE53_HOME=/usr/local/aws/route53
export AWS_CLOUDFRONT_HOME=/usr/local/aws/cloudfront

for i in $EC2_HOME $AWS_IAM_HOME $AWS_RDS_HOME $AWS_ELB_HOME   $AWS_CLOUDFORMATION_HOME $AWS_AUTO_SCALING_HOME $CS_HOME   $AWS_CLOUDWATCH_HOME $AWS_ELASTICACHE_HOME $AWS_SNS_HOME   $AWS_ROUTE53_HOME $AWS_CLOUDFRONT_HOME /usr/local/aws/s3
do
  PATH=$i/bin:$PATH
done
PATH=/usr/local/aws/elasticbeanstalk/eb/linux/python2.7:$PATH
PATH=/usr/local/aws/elasticmapreduce:$PATH
PATH=/usr/local/aws/datapipeline:$PATH

export EC2_PRIVATE_KEY=$(echo $HOME/.aws-default/pk-*.pem)
export EC2_CERT=$(echo $HOME/.aws-default/cert-*.pem)
export AWS_CREDENTIAL_FILE=$HOME/.aws-default/aws-credential-file.txt
export ELASTIC_MAPREDUCE_CREDENTIALS=$HOME/.aws-default/aws-credentials.json
export DATA_PIPELINE_CREDENTIALS=$HOME/.aws-default/aws-credentials.json


## Setup current shell

source $HOME/.bashrc