

aws ec2 run-instances --image-id ami-0bbc25e23a7640b9b --count 1 --instance-type m5.large --key-name passw --security-group-ids sg-049c1f399c9ff55e5 --subnet-id subnet-c5bff68d

aws ec2 run-instances --image-id ami-02a2af70a66af6dfb --count 1 --instance-type m5.large --key-name key1 --security-group-ids sg-00ffbae2b9a36ce36 --subnet-id subnet-0a2b81b8d7b2b6502
