import boto3
import time
from botocore.exceptions import WaiterError

class DMSTaskManager:
    def __init__(self):
        self.dms_client = boto3.client('dms')
        
    def wait_for_task_completion(self, task_arn):
        """Wait for DMS task to complete"""
        while True:
            response = self.dms_client.describe_replication_tasks(
                Filters=[{
                    'Name': 'replication-task-arn',
                    'Values': [task_arn]
                }]
            )
            
            task = response['ReplicationTasks'][0]
            status = task['Status']
            
            if status == 'running':
                time.sleep(60)  # Wait for 60 seconds before next check
                continue
            elif status == 'stopped':
                return True
            elif status in ['failed', 'error']:
                raise Exception(f"Task failed with status: {status}")
            
    def create_full_load_task(self, task_settings):
        """Create and start full load task"""
        try:
            # Create full load task
            response = self.dms_client.create_replication_task(
                ReplicationTaskIdentifier=task_settings['task_identifier'],
                SourceEndpointArn=task_settings['source_endpoint_arn'],
                TargetEndpointArn=task_settings['target_endpoint_arn'],
                ReplicationInstanceArn=task_settings['replication_instance_arn'],
                MigrationType='full-load',
                TableMappings=task_settings['table_mappings'],
                Settings=task_settings.get('settings', {})
            )
            
            task_arn = response['ReplicationTask']['ReplicationTaskArn']
            
            # Wait for task creation to complete
            waiter = self.dms_client.get_waiter('replication_task_ready')
            waiter.wait(
                Filters=[{
                    'Name': 'replication-task-arn',
                    'Values': [task_arn]
                }]
            )
            
            # Start the task
            self.dms_client.start_replication_task(
                ReplicationTaskArn=task_arn,
                StartReplicationTaskType='start-replication'
            )
            
            return task_arn
            
        except Exception as e:
            print(f"Error creating/starting full load task: {str(e)}")
            raise
    
    def get_checkpoint_info(self, task_arn):
        """Get checkpoint information from completed task"""
        try:
            response = self.dms_client.describe_replication_tasks(
                Filters=[{
                    'Name': 'replication-task-arn',
                    'Values': [task_arn]
                }]
            )
            
            task = response['ReplicationTasks'][0]
            return {
                'checkpoint': task.get('ReplicationTaskStats', {}).get('FullLoadStartPosition'),
                'stop_position': task.get('ReplicationTaskStats', {}).get('StopPosition')
            }
            
        except Exception as e:
            print(f"Error getting checkpoint info: {str(e)}")
            raise
    
    def create_cdc_task(self, task_settings, checkpoint_info):
        """Create and start CDC task with checkpoint"""
        try:
            # Create CDC task
            response = self.dms_client.create_replication_task(
                ReplicationTaskIdentifier=f"{task_settings['task_identifier']}-cdc",
                SourceEndpointArn=task_settings['source_endpoint_arn'],
                TargetEndpointArn=task_settings['target_endpoint_arn'],
                ReplicationInstanceArn=task_settings['replication_instance_arn'],
                MigrationType='cdc',
                CdcStartPosition=checkpoint_info['checkpoint'],
                TableMappings=task_settings['table_mappings'],
                Settings=task_settings.get('settings', {})
            )
            
            cdc_task_arn = response['ReplicationTask']['ReplicationTaskArn']
            
            # Wait for task creation to complete
            waiter = self.dms_client.get_waiter('replication_task_ready')
            waiter.wait(
                Filters=[{
                    'Name': 'replication-task-arn',
                    'Values': [cdc_task_arn]
                }]
            )
            
            # Start the CDC task
            self.dms_client.start_replication_task(
                ReplicationTaskArn=cdc_task_arn,
                StartReplicationTaskType='start-replication'
            )
            
            return cdc_task_arn
            
        except Exception as e:
            print(f"Error creating/starting CDC task: {str(e)}")
            raise

def main():
    # Initialize task settings
    task_settings = {
        'task_identifier': 'my-migration-task',
        'source_endpoint_arn': 'your-source-endpoint-arn',
        'target_endpoint_arn': 'your-target-endpoint-arn',
        'replication_instance_arn': 'your-replication-instance-arn',
        'table_mappings': json.dumps({
            "rules": [{
                "rule-type": "selection",
                "rule-id": "1",
                "rule-name": "1",
                "object-locator": {
                    "schema-name": "%",
                    "table-name": "%"
                },
                "rule-action": "include"
            }]
        }),
        'settings': {
            'TargetMetadata': {
                'TaskRecoveryTableEnabled': True  # Enable checkpoint tracking
            }
        }
    }
    
    # Initialize DMS task manager
    dms_manager = DMSTaskManager()
    
    try:
        # Create and start full load task
        print("Starting full load task...")
        full_load_task_arn = dms_manager.create_full_load_task(task_settings)
        
        # Wait for full load to complete
        print("Waiting for full load task to complete...")
        dms_manager.wait_for_task_completion(full_load_task_arn)
        
        # Get checkpoint information
        print("Getting checkpoint information...")
        checkpoint_info = dms_manager.get_checkpoint_info(full_load_task_arn)
        
        # Create and start CDC task
        print("Starting CDC task...")
        cdc_task_arn = dms_manager.create_cdc_task(task_settings, checkpoint_info)
        
        print("Migration tasks created successfully!")
        print(f"CDC Task ARN: {cdc_task_arn}")
        
    except Exception as e:
        print(f"Error in migration process: {str(e)}")
        raise

if __name__ == "__main__":
    main()
