# AWS DMS CLI Command Examples

This document provides a comprehensive list of AWS CLI command examples for AWS Database Migration Service (DMS). These examples cover various aspects of DMS, including replication instances, endpoints, tasks, and more.

## Table of Contents
- [Replication Instances](#replication-instances)
- [Endpoints](#endpoints)
- [Replication Tasks](#replication-tasks)
- [Certificates](#certificates)
- [Event Subscriptions](#event-subscriptions)
- [Pending Maintenance](#pending-maintenance)
- [Tags](#tags)

## Replication Instances

### Create a replication instance
```bash
aws dms create-replication-instance \
    --replication-instance-identifier my-replication-instance \
    --replication-instance-class dms.t3.medium \
    --allocated-storage 50 \
    --engine-version 3.4.6 \
    --availability-zone us-west-2a \
    --vpc-security-group-ids sg-0123456789abcdef0 \
    --multi-az false \
    --publicly-accessible false
```

### Describe replication instances
```bash
aws dms describe-replication-instances
```

### Modify a replication instance
```bash
aws dms modify-replication-instance \
    --replication-instance-arn arn:aws:dms:us-west-2:123456789012:rep:ABCDEFGHIJKLMNOPQRSTUVWXYZ \
    --apply-immediately \
    --allocated-storage 100 \
    --replication-instance-class dms.t3.large
```

### Delete a replication instance
```bash
aws dms delete-replication-instance \
    --replication-instance-arn arn:aws:dms:us-west-2:123456789012:rep:ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

### Reboot a replication instance
```bash
aws dms reboot-replication-instance \
    --replication-instance-arn arn:aws:dms:us-west-2:123456789012:rep:ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

## Endpoints

### Create an endpoint
```bash
aws dms create-endpoint \
    --endpoint-identifier my-source-endpoint \
    --endpoint-type source \
    --engine-name mysql \
    --username myuser \
    --password mypassword \
    --server-name myserver.example.com \
    --port 3306 \
    --database-name mydb
```

### Describe endpoints
```bash
aws dms describe-endpoints
```

### Modify an endpoint
```bash
aws dms modify-endpoint \
    --endpoint-arn arn:aws:dms:us-west-2:123456789012:endpoint:ABCDEFGHIJKLMNOPQRSTUVWXYZ \
    --endpoint-identifier new-endpoint-name \
    --server-name newserver.example.com
```

### Delete an endpoint
```bash
aws dms delete-endpoint \
    --endpoint-arn arn:aws:dms:us-west-2:123456789012:endpoint:ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

### Test endpoint connection
```bash
aws dms test-connection \
    --replication-instance-arn arn:aws:dms:us-west-2:123456789012:rep:ABCDEFGHIJKLMNOPQRSTUVWXYZ \
    --endpoint-arn arn:aws:dms:us-west-2:123456789012:endpoint:ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

## Replication Tasks

### Create a replication task
```bash
aws dms create-replication-task \
    --replication-task-identifier my-task \
    --source-endpoint-arn arn:aws:dms:us-west-2:123456789012:endpoint:SOURCE_ENDPOINT_ID \
    --target-endpoint-arn arn:aws:dms:us-west-2:123456789012:endpoint:TARGET_ENDPOINT_ID \
    --replication-instance-arn arn:aws:dms:us-west-2:123456789012:rep:REPLICATION_INSTANCE_ID \
    --migration-type full-load-and-cdc \
    --table-mappings file://table-mappings.json \
    --replication-task-settings file://task-settings.json
```

### Describe replication tasks
```bash
aws dms describe-replication-tasks
```

### Modify a replication task
```bash
aws dms modify-replication-task \
    --replication-task-arn arn:aws:dms:us-west-2:123456789012:task:ABCDEFGHIJKLMNOPQRSTUVWXYZ \
    --replication-task-identifier new-task-name \
    --migration-type cdc
```

### Delete a replication task
```bash
aws dms delete-replication-task \
    --replication-task-arn arn:aws:dms:us-west-2:123456789012:task:ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

### Start a replication task
```bash
aws dms start-replication-task \
    --replication-task-arn arn:aws:dms:us-west-2:123456789012:task:ABCDEFGHIJKLMNOPQRSTUVWXYZ \
    --start-replication-task-type start-replication
```

### Stop a replication task
```bash
aws dms stop-replication-task \
    --replication-task-arn arn:aws:dms:us-west-2:123456789012:task:ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

### Reload tables for a replication task
```bash
aws dms reload-tables \
    --replication-task-arn arn:aws:dms:us-west-2:123456789012:task:ABCDEFGHIJKLMNOPQRSTUVWXYZ \
    --tables-to-reload '[{"schema-name":"myschema","table-name":"mytable"}]'
```

## Certificates

### Import a certificate
```bash
aws dms import-certificate \
    --certificate-identifier my-certificate \
    --certificate-pem file://path/to/certificate.pem
```

### Describe certificates
```bash
aws dms describe-certificates
```

### Delete a certificate
```bash
aws dms delete-certificate \
    --certificate-arn arn:aws:dms:us-west-2:123456789012:cert:ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

## Event Subscriptions

### Create an event subscription
```bash
aws dms create-event-subscription \
    --subscription-name my-event-subscription \
    --sns-topic-arn arn:aws:sns:us-west-2:123456789012:my-topic \
    --source-type replication-instance \
    --event-categories availability configuration creation deletion failure low-storage maintenance
```

### Describe event subscriptions
```bash
aws dms describe-event-subscriptions
```

### Modify an event subscription
```bash
aws dms modify-event-subscription \
    --subscription-name my-event-subscription \
    --enabled false
```

### Delete an event subscription
```bash
aws dms delete-event-subscription \
    --subscription-name my-event-subscription
```

## Pending Maintenance

### Apply pending maintenance action
```bash
aws dms apply-pending-maintenance-action \
    --replication-instance-arn arn:aws:dms:us-west-2:123456789012:rep:ABCDEFGHIJKLMNOPQRSTUVWXYZ \
    --apply-action system-update \
    --opt-in-type immediate
```

### Describe pending maintenance actions
```bash
aws dms describe-pending-maintenance-actions
```

## Tags

### Add tags to resource
```bash
aws dms add-tags-to-resource \
    --resource-arn arn:aws:dms:us-west-2:123456789012:rep:ABCDEFGHIJKLMNOPQRSTUVWXYZ \
    --tags Key=Environment,Value=Production
```

### List tags for resource
```bash
aws dms list-tags-for-resource \
    --resource-arn arn:aws:dms:us-west-2:123456789012:rep:ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

### Remove tags from resource
```bash
aws dms remove-tags-from-resource \
    --resource-arn arn:aws:dms:us-west-2:123456789012:rep:ABCDEFGHIJKLMNOPQRSTUVWXYZ \
    --tag-keys Environment
```

This comprehensive list of AWS CLI commands for DMS covers most common operations. Remember to replace placeholder values (like ARNs, identifiers, and other parameters) with your actual values when using these commands.

For the most up-to-date and complete list of AWS DMS CLI commands, refer to the official AWS CLI Command Reference for DMS: https://docs.aws.amazon.com/cli/latest/reference/dms/index.html
