cd /home/hadoop/
aws s3 cp s3://ccdh-data/hadoop-jar-extensions/postgresql-42.2.1.jre6.jar ./
sudo cp ./postgresql-42.2.1.jre6.jar /usr/lib/sqoop/lib/
#s3-dist-cp --src=/user/hadoop/sqoop-blog-rds.jceks --dest=s3://ccdh-data/hadoop-database-credentials/sqoop-rds.jceks
aws s3 cp s3://ccdh-data/hadoop-database-credentials/sqoop-blog-rds.jceks ./
hadoop fs -put -f ./sqoop-blog-rds.jceks /user/hadoop/sqoop-blog-rds.jceks

aws s3 cp s3://ccdh-data/hadoop-emr-steps/step3-sqoop-options.txt ./sqoop-options.txt