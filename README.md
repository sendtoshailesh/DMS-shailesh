# Refer my authored blog on AWS DMS on Cost Optimize Database Migrations with AWS DMS:
For the full blog post part 1, visit [AWS Database Blog](https://aws.amazon.com/blogs/database/cost-optimize-database-migrations-with-aws-dms-part-1/)
For the full blog post part 2, visit [AWS Database Blog](https://aws.amazon.com/blogs/database/cost-optimize-database-migrations-with-aws-dms-part-2/)

-------------------------------------------
DMS Monitoring setup --> [Step by Step](https://www.linkedin.com/posts/shaileshmishra1_awsdatabasemigration-continuousreplication-activity-7237005834885509120-Wnc-)
-------------------------------------------

# AWS Database Migration Service (DMS) Resources

This README provides a comprehensive list of resources related to AWS Database Migration Service (DMS). It includes official documentation, blog posts, workshops, and tools to help you understand and effectively use AWS DMS.

## Table of Contents
- [General DMS Resources](#general-dms-resources)
- [AWS Schema Conversion Tool (SCT)](#aws-schema-conversion-tool-sct)
- [Change Data Capture (CDC)](#change-data-capture-cdc)
- [Monitoring and Debugging](#monitoring-and-debugging)
- [Performance Optimization](#performance-optimization)
- [Database-Specific Resources](#database-specific-resources)
  - [Oracle](#oracle)
  - [SQL Server](#sql-server)
  - [PostgreSQL](#postgresql)
  - [Redis](#redis)
- [Analytics and Data Lakes](#analytics-and-data-lakes)
- [NoSQL Databases](#nosql-databases)
- [Large Object (LOB) Handling](#large-object-lob-handling)
- [Configuration and Best Practices](#configuration-and-best-practices)
- [Automation and Scripting](#automation-and-scripting)
- [Workshops and Hands-on Labs](#workshops-and-hands-on-labs)

## General DMS Resources

- [AWS Database Migration Service (DMS) - Official Documentation](https://docs.aws.amazon.com/dms/)
- [AWS Database Migration Service Best Practices](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_BestPractices.html)
- [AWS Database Migration Service | AWS Database Blog](https://aws.amazon.com/blogs/database/category/database/aws-database-migration-service/)
- [AWS DMS Samples on GitHub](https://github.com/aws-samples/aws-database-migration-samples)

## AWS Schema Conversion Tool (SCT)

- [What is the AWS Schema Conversion Tool?](https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_Welcome.html)
- [AWS SCT CLI Reference](https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_CLI.html)
- [Converting database schemas using AWS SCT](https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_Converting.html)
- [Creating migration assessment reports with AWS SCT](https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_AssessmentReport.html)
- [Using AWS SCT extension packs](https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_ExtensionPack.html)
- [Converting application SQL using AWS SCT](https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_ConvertSQL.html)
- [Best practices for AWS SCT](https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_BestPractices.html)

## Change Data Capture (CDC)

- [Change processing tuning settings - AWS DMS](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TaskSettings.ChangeProcessingTuning.html)
- [Creating tasks for ongoing replication using AWS DMS](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CDC.html)
- [How DMS reads the CDC changes in different engines (MySQL, SQL Server & PostgreSQL)?](https://repost.aws/knowledge-center/dms-cdc-changes-different-engines)

## Monitoring and Debugging

- [Monitoring AWS DMS tasks](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Monitoring.html)
- [Send alerts on custom AWS DMS errors from Amazon CloudWatch Logs](https://aws.amazon.com/blogs/database/send-alerts-on-custom-aws-dms-errors-from-amazon-cloudwatch-logs/)
- [Setting up Amazon CloudWatch alarms for AWS DMS resources using the AWS CLI](https://aws.amazon.com/blogs/database/setting-up-amazon-cloudwatch-alarms-for-aws-dms-resources-using-the-aws-cli/)
- [Debug AWS DMS tasks using Time Travel](https://aws.amazon.com/blogs/database/debug-aws-dms-tasks-using-time-travel/)
- [Troubleshooting migration tasks in AWS DMS](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Troubleshooting.html)

## Performance Optimization

- [Perform parallel load for partitioned data into Amazon S3 using AWS DMS](https://aws.amazon.com/blogs/database/perform-parallel-load-for-partitioned-data-into-amazon-s3-using-aws-dms/)
- [How to use segmentation to improve performance for large MongoDB and Amazon DocumentDB migrations in AWS DMS](https://aws.amazon.com/blogs/database/how-to-use-segmentation-to-improve-performance-for-large-mongodb-and-amazon-documentdb-migrations-in-aws-dms/)
- [Achieve a high-performance migration to Amazon RDS for Oracle from on-premises Oracle with AWS DMS](https://aws.amazon.com/blogs/database/achieve-a-high-performance-migration-to-amazon-rds-for-oracle-from-on-premises-oracle-with-aws-dms/)
- [AWS DMS key troubleshooting metrics and performance enhancers](https://aws.amazon.com/blogs/database/aws-dms-key-troubleshooting-metrics-and-performance-enhancers/)

## Database-Specific Resources

### Oracle

- [Migrating Oracle databases with near-zero downtime using AWS DMS](https://aws.amazon.com/blogs/database/migrating-oracle-databases-with-near-zero-downtime-using-aws-dms/)
- [Continuous database replication using AWS DMS to migrate from Oracle to Amazon Aurora](https://aws.amazon.com/blogs/database/continuous-database-replication-using-aws-dms-to-migrate-from-oracle-to-amazon-aurora/)
- [Best practices for migrating an Oracle database to Amazon RDS PostgreSQL or Amazon Aurora PostgreSQL](https://aws.amazon.com/blogs/database/best-practices-for-migrating-an-oracle-database-to-amazon-rds-postgresql-or-amazon-aurora-postgresql-migration-process-and-infrastructure-considerations/)

### SQL Server

- [Migrating your SQL Server database to Amazon RDS for SQL Server using AWS DMS](https://aws.amazon.com/blogs/database/migrating-your-sql-server-database-to-amazon-rds-for-sql-server-using-aws-dms/)
- [Migrate from a Microsoft SQL Server AlwaysOn read-only replica to Amazon Aurora PostgreSQL with AWS DMS](https://aws.amazon.com/blogs/database/migrate-from-a-microsoft-sql-server-alwayson-read-only-replica-to-amazon-aurora-postgresql-with-aws-dms/)
- [Migrate Microsoft SQL Server to Babelfish for Aurora PostgreSQL with minimal downtime using AWS DMS](https://aws.amazon.com/blogs/database/migrate-microsoft-sql-server-to-babelfish-for-aurora-postgresql-with-minimal-downtime-using-aws-dms/)

### PostgreSQL

- [Why do I see high storage consumption on my source PostgreSQL database when I run an AWS DMS CDC task?](https://repost.aws/knowledge-center/dms-high-storage-postgresql-cdc)
- [How to set up PostgreSQL as a source of DMS CDC only task using pglogical](https://repost.aws/knowledge-center/dms-postgresql-source-cdc-pglogical)
- [How to set up PostgreSQL as a source of DMS CDC only task using test_decoding](https://repost.aws/knowledge-center/dms-postgresql-source-cdc-test-decoding)
- [Achieving minimum downtime for major version upgrades in Amazon Aurora for PostgreSQL using AWS DMS](https://aws.amazon.com/blogs/database/achieving-minimum-downtime-for-major-version-upgrades-in-amazon-aurora-for-postgresql-using-aws-dms/)

### Redis

- [Replicate your data from Amazon Aurora MySQL to Amazon ElastiCache for Redis using AWS DMS](https://aws.amazon.com/blogs/database/replicate-your-data-from-amazon-aurora-mysql-to-amazon-elasticache-for-redis-using-aws-dms/)
- [Migrate data from Amazon Aurora PostgreSQL to Amazon MemoryDB for Redis using AWS DMS](https://aws.amazon.com/blogs/database/migrate-data-from-amazon-aurora-postgresql-to-amazon-memorydb-for-redis-using-aws-dms/)

## Analytics and Data Lakes

- [Capture key source table headers data using AWS DMS and use it for Amazon S3 data lake operations](https://aws.amazon.com/blogs/database/capture-key-source-table-headers-data-using-aws-dms-and-use-it-for-amazon-s3-data-lake-operations/)
- [Announcing the support of Parquet data format in AWS DMS 3.1.3](https://aws.amazon.com/blogs/database/announcing-the-support-of-parquet-data-format-in-aws-dms-3-1-3/)
- [How to archive data from relational databases to Amazon Glacier using AWS DMS](https://aws.amazon.com/blogs/database/how-to-archive-data-from-relational-databases-to-amazon-glacier-using-aws-dms/)
- [Using AWS Database Migration Service, Amazon S3, and AWS Lambda for Database Analytics](https://aws.amazon.com/blogs/database/using-aws-database-migration-service-amazon-s3-and-aws-lambda-for-database-analytics/)

## NoSQL Databases

- [Migrating relational databases to Amazon DocumentDB (with MongoDB compatibility)](https://aws.amazon.com/blogs/database/migrating-relational-databases-to-amazon-documentdb-with-mongodb-compatibility/)
- [Populating your graph in Amazon Neptune from a relational database using AWS DMS](https://aws.amazon.com/blogs/database/populating-your-graph-in-amazon-neptune-from-a-relational-database-using-aws-database-migration-service-dms-part-1-setting-the-stage/)
- [Migrate an internet-scale online transactional system to Amazon DynamoDB using AWS DMS](https://aws.amazon.com/blogs/database/migrate-an-internet-scale-online-transactional-system-to-amazon-dynamodb-using-aws-dms/)

## Large Object (LOB) Handling

- [Effectively migrating LOB data to Amazon S3 from Amazon RDS for Oracle with AWS DMS](https://aws.amazon.com/blogs/database/effectively-migrating-lob-data-to-amazon-s3-from-amazon-rds-for-oracle-with-aws-dms/)
- [How to migrate BLOB and CLOB tables from Oracle to PostgreSQL using Ora2pg and AWS DMS](https://aws.amazon.com/blogs/database/how-to-migrate-blob-and-clob-tables-from-oracle-to-postgresql-using-ora2pg-and-aws-dms/)
- [DMS - how LOB works - theory - source: Oracle and target: mysql LOB test](https://repost.aws/knowledge-center/dms-lob-oracle-mysql)

## Configuration and Best Practices

- [Cross-account Amazon Aurora PostgreSQL and Amazon RDS for PostgreSQL migration with reduced downtime using AWS DMS](https://aws.amazon.com/blogs/database/cross-account-amazon-aurora-postgresql-and-amazon-rds-for-postgresql-migration-with-reduced-downtime-using-aws-dms/)
- [VPC endpoint considerations for upgrading or creating AWS DMS version 3.4.7 or higher](https://aws.amazon.com/blogs/database/vpc-endpoint-considerations-for-upgrading-or-creating-aws-dms-version-3-4-7-or-higher/)
- [How AWS DMS handles open transactions when starting a full load and CDC task](https://aws.amazon.com/blogs/database/how-aws-dms-handles-open-transactions-when-starting-a-full-load-and-cdc-task/)
- [Build an incremental data load solution using AWS DMS checkpoints and database logs](https://aws.amazon.com/blogs/database/build-an-incremental-data-load-solution-using-aws-dms-checkpoints-and-database-logs/)

## Automation and Scripting

- [Automate copying AWS DMS tasks across AWS accounts](https://aws.amazon.com/blogs/database/automate-copying-aws-dms-tasks-across-aws-accounts/)
- [Accelerate data migration using AWS DMS and AWS CDK](https://aws.amazon.com/blogs/database/accelerate-data-migration-using-aws-dms-and-aws-cdk/)
- [Automating database migration monitoring with AWS DMS](https://aws.amazon.com/blogs/database/automating-database-migration-monitoring-with-aws-dms/)
- [Automating table mappings creation in AWS DMS](https://aws.amazon.com/blogs/database/automating-table-mappings-creation-in-aws-dms/)
- [Python code to download DMS Task Logs using the AWS DMS Task ID](https://aws.amazon.com/blogs/database/python-code-to-download-dms-task-logs-using-the-aws-dms-task-id/)

## Workshops and Hands-on Labs

- [AWS Database Migration Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/77bdff4f-2d9e-4d68-99ba-248ea95b3aca/en-US)
- [Data Engineering Immersion Day](https://catalog.us-east-1.prod.workshops.aws/workshops/976050cc-0606-4b23-b49f-ca7b8ac3b2a7/en-US)
- [AWS DMS workshop for immersion days](https://catalog.workshops.aws/dms-immersion-day)

This README provides a comprehensive collection of resources for AWS Database Migration Service (DMS). It covers various aspects of DMS, including general information, specific database migrations, performance optimization, monitoring, and best practices. Use these resources to enhance your understanding and effectively utilize AWS DMS for your database migration projects.





