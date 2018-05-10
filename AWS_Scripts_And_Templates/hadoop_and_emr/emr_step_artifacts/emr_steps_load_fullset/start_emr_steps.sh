aws emr create-cluster \
--name "ETL Cluster with CLI" \
--release-label emr-5.11.1 \
--applications Name=Hive Name=Sqoop Name=Tez Name=Spark \
--auto-terminate \
--use-default-roles \
--ec2-attributes KeyName=admin-ccdh-demo,SubnetId=subnet-8f5013a0 \
--instance-groups 'InstanceGroupType=MASTER,InstanceCount=1,InstanceType=m4.2xlarge,BidPrice=.20,EbsConfiguration={EbsOptimized=true,EbsBlockDeviceConfigs=[{VolumeSpecification={VolumeType=gp2,SizeInGB=200}}]' \
  'InstanceGroupType=CORE,InstanceCount=6,InstanceType=m4.xlarge,BidPrice=.10,EbsConfiguration={EbsOptimized=true,EbsBlockDeviceConfigs=[{VolumeSpecification={VolumeType=gp2,SizeInGB=200}}]}' \
--steps file://./emr_steps.json \
--tags Project="ccdh" Environment="dev" Customer="comcast" Name="ETL EMR Steps test with CLI" \
--profile liangdatasherpa
