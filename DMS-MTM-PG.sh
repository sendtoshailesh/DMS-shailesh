

aws ec2 run-instances --image-id ami-0bbc25e23a7640b9b --count 1 --instance-type m5.large --key-name passw --security-group-ids sg-049c1f399c9ff55e5 --subnet-id subnet-c5bff68d

aws ec2 run-instances --image-id ami-02a2af70a66af6dfb --count 1 --instance-type m5.large --key-name key1 --security-group-ids sg-00ffbae2b9a36ce36 --subnet-id subnet-0a2b81b8d7b2b6502



https://medium.com/@sanketgawali531/how-to-install-configure-postgresql-on-amazon-linux-8f39329d0f8e

how to allow remote connection on postgresql

https://www.bigbinary.com/blog/configure-postgresql-to-allow-remote-connection



[ec2-user@ip-172-31-1-99 ~]$ sudo dnf update
Last metadata expiration check: 0:10:45 ago on Fri Nov 17 09:47:47 2023.
Dependencies resolved.
Nothing to do.
Complete!
[ec2-user@ip-172-31-1-99 ~]$ sudo dnf install postgresql15.x86_64 postgresql15-server
Last metadata expiration check: 0:10:56 ago on Fri Nov 17 09:47:47 2023.
Dependencies resolved.
===============================================================================================================================================================================================================================================================================================================================================
 Package                                                                                    Architecture                                                            Version                                                                                 Repository                                                                    Size
===============================================================================================================================================================================================================================================================================================================================================
Installing:
 postgresql15                                                                               x86_64                                                                  15.4-1.amzn2023.0.1                                                                     amazonlinux                                                                  1.6 M
 postgresql15-server                                                                        x86_64                                                                  15.4-1.amzn2023.0.1                                                                     amazonlinux                                                                  6.1 M
Installing dependencies:
 libicu                                                                                     x86_64                                                                  67.1-7.amzn2023.0.3                                                                     amazonlinux                                                                  9.6 M
 postgresql15-private-libs                                                                  x86_64                                                                  15.4-1.amzn2023.0.1                                                                     amazonlinux                                                                  144 k

Transaction Summary
===============================================================================================================================================================================================================================================================================================================================================
Install  4 Packages

Total download size: 17 M
Installed size: 64 M
Is this ok [y/N]: y
Downloading Packages:
(1/4): postgresql15-private-libs-15.4-1.amzn2023.0.1.x86_64.rpm                                                                                                                                                                                                                                                1.1 MB/s | 144 kB     00:00    
(2/4): postgresql15-15.4-1.amzn2023.0.1.x86_64.rpm                                                                                                                                                                                                                                                              10 MB/s | 1.6 MB     00:00    
(3/4): libicu-67.1-7.amzn2023.0.3.x86_64.rpm                                                                                                                                                                                                                                                                    36 MB/s | 9.6 MB     00:00    
(4/4): postgresql15-server-15.4-1.amzn2023.0.1.x86_64.rpm                                                                                                                                                                                                                                                       29 MB/s | 6.1 MB     00:00    
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                                                                                                                                                                           43 MB/s |  17 MB     00:00     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                                                                                                                                                                       1/1 
  Installing       : postgresql15-private-libs-15.4-1.amzn2023.0.1.x86_64                                                                                                                                                                                                                                                                  1/4 
  Installing       : postgresql15-15.4-1.amzn2023.0.1.x86_64                                                                                                                                                                                                                                                                               2/4 
  Installing       : libicu-67.1-7.amzn2023.0.3.x86_64                                                                                                                                                                                                                                                                                     3/4 
  Running scriptlet: postgresql15-server-15.4-1.amzn2023.0.1.x86_64                                                                                                                                                                                                                                                                        4/4 
  Installing       : postgresql15-server-15.4-1.amzn2023.0.1.x86_64                                                                                                                                                                                                                                                                        4/4 
  Running scriptlet: postgresql15-server-15.4-1.amzn2023.0.1.x86_64                                                                                                                                                                                                                                                                        4/4 
  Verifying        : postgresql15-15.4-1.amzn2023.0.1.x86_64                                                                                                                                                                                                                                                                               1/4 
  Verifying        : libicu-67.1-7.amzn2023.0.3.x86_64                                                                                                                                                                                                                                                                                     2/4 
  Verifying        : postgresql15-private-libs-15.4-1.amzn2023.0.1.x86_64                                                                                                                                                                                                                                                                  3/4 
  Verifying        : postgresql15-server-15.4-1.amzn2023.0.1.x86_64                                                                                                                                                                                                                                                                        4/4 

Installed:
  libicu-67.1-7.amzn2023.0.3.x86_64                                         postgresql15-15.4-1.amzn2023.0.1.x86_64                                         postgresql15-private-libs-15.4-1.amzn2023.0.1.x86_64                                         postgresql15-server-15.4-1.amzn2023.0.1.x86_64                                        

Complete!
[ec2-user@ip-172-31-1-99 ~]$ sudo postgresql-setup --initdb
 * Initializing database in '/var/lib/pgsql/data'
 * Initialized, logs are in /var/lib/pgsql/initdb_postgresql.log
[ec2-user@ip-172-31-1-99 ~]$ sudo systemctl start postgresql
[ec2-user@ip-172-31-1-99 ~]$ sudo passwd postgres
Changing password for user postgres.
New password: 
BAD PASSWORD: The password fails the dictionary check - it is based on a dictionary word
Retype new password: 
passwd: all authentication tokens updated successfully.
[ec2-user@ip-172-31-1-99 ~]$ su – postgres
su: user – does not exist or the user entry does not contain all the required fields
[ec2-user@ip-172-31-1-99 ~]$ su – postgres
su: user – does not exist or the user entry does not contain all the required fields
[ec2-user@ip-172-31-1-99 ~]$ 
[ec2-user@ip-172-31-1-99 ~]$ 
[ec2-user@ip-172-31-1-99 ~]$ 
[ec2-user@ip-172-31-1-99 ~]$ su - postgres
Password: 
[postgres@ip-172-31-1-99 ~]$ 
[postgres@ip-172-31-1-99 ~]$ 
[postgres@ip-172-31-1-99 ~]$ 
[postgres@ip-172-31-1-99 ~]$ psql -c "ALTER USER postgres WITH PASSWORD 'your-password';"
ALTER ROLE
[postgres@ip-172-31-1-99 ~]$ sudo vi /var/lib/pgsql/data/postgresql.conf

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

For security reasons, the password you type will not be visible.

[sudo] password for postgres: 
postgres is not in the sudoers file.
[postgres@ip-172-31-1-99 ~]$ exit
logout
[ec2-user@ip-172-31-1-99 ~]$ sudo vi /var/lib/pgsql/data/postgresql.conf
[ec2-user@ip-172-31-1-99 ~]$ sudo vi /var/lib/pgsql/data/postgresql.conf
[ec2-user@ip-172-31-1-99 ~]$ sudo systemctl restart postgresql
[ec2-user@ip-172-31-1-99 ~]$ netstat -nlt
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State      
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN     
tcp        0      0 0.0.0.0:5432            0.0.0.0:*               LISTEN     
tcp6       0      0 :::22                   :::*                    LISTEN     
tcp6       0      0 :::5432                 :::*                    LISTEN     
[ec2-user@ip-172-31-1-99 ~]$ sudo vi /var/lib/pgsql/data/pg_hba.conf
[ec2-user@ip-172-31-1-99 ~]$ sudo systemctl restart postgresql
[ec2-user@ip-172-31-1-99 ~]$ netstat -nlt













Step 1: Update AL2023 Packages
On any Linux before installing packages, a user should run a system update command that will ensure all the latest available updates are installed on the system. Plus, this will also refresh the DNF package cache.

So, get access to your terminal or connect to your Amazon Linux instance via SSH and run the following command:

sudo dnf update


Step 2: Install PostgreSQL 15 on Amazon Linux 2023
Well, the best thing currently you don’t need to add any repository to get the PostgreSQL version 15 on your Amazon Linux 2023 because it is available through its system default repo. So, what you have to do is just run the given command. It will install both the client and server parts of the PostgreSQL Database system on your Linux.

sudo dnf install postgresql15.x86_64 postgresql15-server



Step 3: Initialize the PostgreSQL Database
Now, before starting and enabling the service of the Database, let’s initialize it. For that use initdb which will create a new PostgreSQL database cluster refers to a collection of databases managed by a single server instance.

sudo postgresql-setup --initdb


Step 5: Add the PostgreSQL service to the system startup.
sudo systemctl start postgresql


Step 6: Check the status of PostgreSQL using the following command.
sudo systemctl status postgresql
Set Password For Postgres User



Step 7:Change the Admin database password
Change user password
To make sure our PostgreSQL is secured with a strong password, set a password for its system user and default database admin user account using the below-given commands-

sudo passwd postgres
login using Postgres system account-
su – postgres
Now, change the Admin database password-
psql -c "ALTER USER postgres WITH PASSWORD 'your-password';"



Enable Remote Connection For PostgreSQL on Amazon Linux



Configuring postgresql.conf
In order to fix this issue we need to find postgresql.conf. In different systems it is located at different place. I usually search for it.


$ find / -name "postgresql.conf"
/var/lib/pgsql/9.4/data/postgresql.conf

Open postgresql.conf file and replace line


listen_addresses = 'localhost'

with


listen_addresses = '*'

Now restart postgresql server.


$ netstat -nlt
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 127.0.0.1:11211         0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:5432            0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:2812          0.0.0.0:*               LISTEN
tcp6       0      0 ::1:11211               :::*                    LISTEN
tcp6       0      0 :::22                   :::*                    LISTEN
tcp6       0      0 :::5432                 :::*                    LISTEN
tcp6       0      0 ::1:25                  :::*                    LISTEN

Here we can see that "Local Address" for port 5432 has changed to 0.0.0.0.

Configuring pg_hba.conf
Let's try to connect to remote postgresql server using "psql".


$ psql -h 107.170.158.89 -U postgres
psql: could not connect to server: Connection refused
	Is the server running on host "107.170.158.89" and accepting
	TCP/IP connections on port 5432?

In order to fix it, open pg_hba.conf and add following entry at the very end.


host    all             all              0.0.0.0/0                       md5
host    all             all              ::/0                            md5

The second entry is for IPv6 network.

Do not get confused by "md5" option mentioned above. All it means is that a password needs to be provided. If you want client to allow collection without providing any password then change "md5" to "trust" and that will allow connection unconditionally.

Restart postgresql server.


$ psql -h 107.170.158.89 -U postgres
Password for user postgres:
psql (9.4.1, server 9.4.5)
Type "help" for help.

postgres=# \l

You should be able to see list of databases.

Now we are able to connect to postgresql server remotely.

Please note that in the real world you should be using extra layer of security by using "iptables".









