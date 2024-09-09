# AWS Database Migration Service (DMS) Cheat Sheet

## Quick Start

1. Create replication instance
2. Create source and target endpoints
3. Create and start replication task

## Common DMS CLI Commands

```bash
# Create a replication instance
aws dms create-replication-instance --replication-instance-identifier my-replication-instance --replication-instance-class dms.t3.medium --allocated-storage 50

# Create a source endpoint
aws dms create-endpoint --endpoint-identifier source-endpoint --endpoint-type source --engine-name mysql --username your_username --password your_password --server-name source-server.example.com --port 3306 --database-name mydb

# Create a target endpoint
aws dms create-endpoint --endpoint-identifier target-endpoint --endpoint-type target --engine-name postgres --username your_username --password your_password --server-name target-server.example.com --port 5432 --database-name mydb

# Create a replication task
aws dms create-replication-task --replication-task-identifier my-task --source-endpoint-arn arn:aws:dms:region:account:endpoint:source-endpoint-id --target-endpoint-arn arn:aws:dms:region:account:endpoint:target-endpoint-id --replication-instance-arn arn:aws:dms:region:account:rep:replication-instance-id --migration-type full-load-and-cdc --table-mappings file://table-mappings.json --replication-task-settings file://task-settings.json

# Start a replication task
aws dms start-replication-task --replication-task-arn arn:aws:dms:region:account:task:task-id --start-replication-task-type start-replication
```

## Key Concepts

- **Replication Instance**: EC2 instance that runs the replication tasks
- **Endpoints**: Source and target connection information
- **Replication Task**: Defines what data is replicated and how
- **CDC (Change Data Capture)**: Captures ongoing changes after initial full load

## Best Practices

1. Size your replication instance appropriately
2. Use Multi-AZ for production workloads
3. Enable CloudWatch monitoring
4. Use table mapping for selective data replication
5. Test thoroughly before production migration

## Performance Tuning

- Increase `MaxFullLoadSubTasks` for parallel full load
- Adjust `BatchApplyEnabled` for batch transactions
- Use `ParallelApplyThreads` for multi-threaded apply
- Enable `StreamBufferSize` for better CDC performance

## Monitoring

Key CloudWatch metrics:
- `CDCLatencySource`
- `CDCLatencyTarget`
- `CPUUtilization`
- `FreeStorageSpace`

## Troubleshooting

1. Check task status and logs in AWS DMS console
2. Verify network connectivity between source, replication instance, and target
3. Ensure sufficient permissions on source and target databases
4. Review CloudWatch logs for detailed error messages

## Useful Table Mapping Rules

```json
{
  "rules": [
    {
      "rule-type": "selection",
      "rule-id": "1",
      "rule-name": "1",
      "object-locator": {
        "schema-name": "myschema",
        "table-name": "%"
      },
      "rule-action": "include"
    },
    {
      "rule-type": "transformation",
      "rule-id": "2",
      "rule-name": "2",
      "rule-target": "column",
      "object-locator": {
        "schema-name": "myschema",
        "table-name": "mytable",
        "column-name": "oldcolumn"
      },
      "rule-action": "rename",
      "value": "newcolumn"
    }
  ]
}
```

## Common Task Settings

```json
{
  "TargetMetadata": {
    "TargetSchema": "",
    "SupportLobs": true,
    "FullLobMode": false,
    "LobChunkSize": 64,
    "LimitedSizeLobMode": true,
    "LobMaxSize": 32
  },
  "FullLoadSettings": {
    "TargetTablePrepMode": "DROP_AND_CREATE",
    "CreatePkAfterFullLoad": false,
    "StopTaskCachedChangesApplied": false,
    "StopTaskCachedChangesNotApplied": false,
    "MaxFullLoadSubTasks": 8,
    "TransactionConsistencyTimeout": 600,
    "CommitRate": 10000
  },
  "Logging": {
    "EnableLogging": true,
    "LogComponents": [
      {
        "Id": "TRANSFORMATION",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "SOURCE_UNLOAD",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "IO",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "TARGET_LOAD",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "PERFORMANCE",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "SOURCE_CAPTURE",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "SORTER",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "REST_SERVER",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "VALIDATOR_EXT",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "TARGET_APPLY",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "TASK_MANAGER",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "TABLES_MANAGER",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "METADATA_MANAGER",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "FILE_FACTORY",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "COMMON",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "ADDONS",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "DATA_STRUCTURE",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "COMMUNICATION",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      },
      {
        "Id": "FILE_TRANSFER",
        "Severity": "LOGGER_SEVERITY_DEFAULT"
      }
    ]
  },
  "ControlTablesSettings": {
    "ControlSchema": "",
    "HistoryTimeslotInMinutes": 5,
    "HistoryTableEnabled": false,
    "SuspendedTablesTableEnabled": false,
    "StatusTableEnabled": false
  },
  "StreamBufferSettings": {
    "StreamBufferCount": 3,
    "StreamBufferSizeInMB": 8,
    "CtrlStreamBufferSizeInMB": 5
  },
  "ChangeProcessingDdlHandlingPolicy": {
    "HandleSourceTableDropped": true,
    "HandleSourceTableTruncated": true,
    "HandleSourceTableAltered": true
  },
  "ErrorBehavior": {
    "DataErrorPolicy": "LOG_ERROR",
    "DataTruncationErrorPolicy": "LOG_ERROR",
    "DataErrorEscalationPolicy": "SUSPEND_TABLE",
    "DataErrorEscalationCount": 0,
    "TableErrorPolicy": "SUSPEND_TABLE",
    "TableErrorEscalationPolicy": "STOP_TASK",
    "TableErrorEscalationCount": 0,
    "RecoverableErrorCount": -1,
    "RecoverableErrorInterval": 5,
    "RecoverableErrorThrottling": true,
    "RecoverableErrorThrottlingMax": 1800,
    "ApplyErrorDeletePolicy": "IGNORE_RECORD",
    "ApplyErrorInsertPolicy": "LOG_ERROR",
    "ApplyErrorUpdatePolicy": "LOG_ERROR",
    "ApplyErrorEscalationPolicy": "LOG_ERROR",
    "ApplyErrorEscalationCount": 0,
    "FullLoadIgnoreConflicts": true
  },
  "ChangeProcessingTuning": {
    "BatchApplyPreserveTransaction": true,
    "BatchApplyTimeoutMin": 1,
    "BatchApplyTimeoutMax": 30,
    "BatchApplyMemoryLimit": 500,
    "BatchSplitSize": 0,
    "MinTransactionSize": 1000,
    "CommitTimeout": 1,
    "MemoryLimitTotal": 1024,
    "MemoryKeepTime": 60,
    "StatementCacheSize": 50
  },
  "PostProcessingRules": null,
  "CharacterSetSettings": null,
  "LoopbackPreventionSettings": null,
  "BeforeImageSettings": null
}
```

Remember to adjust these settings based on your specific migration requirements and database characteristics.
