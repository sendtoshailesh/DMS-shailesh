shkm1:~/environment $ ./cr-gce.sh 
which: no nc in (/home/ec2-user/environment/google-cloud-sdk/bin:/home/ec2-user/.rvm/gems/ruby-2.6.3/bin:/home/ec2-user/.rvm/gems/ruby-2.6.3@global/bin:/home/ec2-user/.rvm/rubies/ruby-2.6.3/bin:/home/ec2-user/.nvm/versions/node/v16.15.0/bin:/home/ec2-user/.rvm/gems/ruby-2.6.3/bin:/home/ec2-user/.rvm/gems/ruby-2.6.3@global/bin:/home/ec2-user/.rvm/rubies/ruby-2.6.3/bin:/home/ec2-user/.rvm/gems/ruby-2.6.3/bin:/home/ec2-user/.rvm/gems/ruby-2.6.3@global/bin:/home/ec2-user/.rvm/rubies/ruby-2.6.3/bin:/usr/local/bin:/usr/bin:/home/ec2-user/.local/bin:/home/ec2-user/bin:/usr/local/bin:/home/ec2-user/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/ec2-user/.local/bin:/home/ec2-user/bin:/usr/local/bin:/home/ec2-user/.rvm/bin:/home/ec2-user/.local/bin:/home/ec2-user/bin:/home/ec2-user/.local/bin:/home/ec2-user/bin:/usr/local/bin:/home/ec2-user/.rvm/bin:/home/ec2-user/.local/bin:/home/ec2-user/bin)
Verifying connectivity via /dev/tcp command to source DB: IP database-1.cluster-c28xksfapomc.us-east-1.rds.amazonaws.com port 3306
Connection to source DB verified
Creating a virtual machine (VM) instance named 'dms-rev-proxy' in zone 'us-central1-f'
Created [https://www.googleapis.com/compute/v1/projects/shailesh-1/zones/us-central1-f/instances/dms-rev-proxy].
NAME           ZONE           MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP     STATUS
dms-rev-proxy  us-central1-f  n1-standard-1               10.0.1.22    35.184.172.130  RUNNING
Validating ssh connectivity to dms-rev-proxy
WARNING: The private SSH key file for gcloud does not exist.
WARNING: The public SSH key file for gcloud does not exist.
WARNING: You do not have an SSH key for gcloud.
WARNING: SSH keygen will be executed to generate a key.
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/ec2-user/.ssh/google_compute_engine.
Your public key has been saved in /home/ec2-user/.ssh/google_compute_engine.pub.
The key fingerprint is:
SHA256:h6yN6+dKlRDB0KJC8dyM5hl/womJjrpIsz67YMU/HMk ec2-user@ip-172-31-4-42.ec2.internal
The key's randomart image is:
+---[RSA 2048]----+
| .. .+o.         |
| .o = o.         |
|.  B +.          |
|. * O oo o       |
| o B E .S .      |
|o . o += .       |
|o=   ++ .        |
|*.o  ....        |
|=*+  .++.        |
+----[SHA256]-----+
ssh: connect to host 35.184.172.130 port 22: Connection timed out

Recommendation: To check for possible causes of SSH connectivity issues and get
recommendations, rerun the ssh command with the --troubleshoot option.

gcloud compute ssh dms-rev-proxy --project=shailesh-1 --zone=us-central1-f --troubleshoot

Or, to investigate an IAP tunneling issue:

gcloud compute ssh dms-rev-proxy --project=shailesh-1 --zone=us-central1-f --troubleshoot --tunnel-through-iap

ERROR: (gcloud.compute.ssh) [/usr/bin/ssh] exited with return code [255].
Retry 1/10 - ssh to "dms-rev-proxy" --zone="us-central1-f" --project="shailesh-1" Failed. Retrying in 5 seconds
ssh: connect to host 35.184.172.130 port 22: Connection timed out

Recommendation: To check for possible causes of SSH connectivity issues and get
recommendations, rerun the ssh command with the --troubleshoot option.

gcloud compute ssh dms-rev-proxy --project=shailesh-1 --zone=us-central1-f --troubleshoot

Or, to investigate an IAP tunneling issue:

gcloud compute ssh dms-rev-proxy --project=shailesh-1 --zone=us-central1-f --troubleshoot --tunnel-through-iap

ERROR: (gcloud.compute.ssh) [/usr/bin/ssh] exited with return code [255].
Retry 2/10 - ssh to "dms-rev-proxy" --zone="us-central1-f" --project="shailesh-1" Failed. Retrying in 5 seconds
ssh: connect to host 35.184.172.130 port 22: Connection timed out

Recommendation: To check for possible causes of SSH connectivity issues and get
recommendations, rerun the ssh command with the --troubleshoot option.

gcloud compute ssh dms-rev-proxy --project=shailesh-1 --zone=us-central1-f --troubleshoot

Or, to investigate an IAP tunneling issue:

gcloud compute ssh dms-rev-proxy --project=shailesh-1 --zone=us-central1-f --troubleshoot --tunnel-through-iap

ERROR: (gcloud.compute.ssh) [/usr/bin/ssh] exited with return code [255].
Retry 3/10 - ssh to "dms-rev-proxy" --zone="us-central1-f" --project="shailesh-1" Failed. Retrying in 5 seconds
Warning: Permanently added 'compute.8904526114772192674' (ECDSA) to the list of known hosts.
Connection to 35.184.172.130 closed.
dms-rev-proxy is accessible through ssh
GatewayPorts yes
Connection to 35.184.172.130 closed.
VM instance 'dms-rev-proxy' created with private ip 10.0.1.22
Setting up SSH tunnel between the source and the VM on port '3306'
SSH tunnel is ready on port 3306
shkm1:~/environment $



