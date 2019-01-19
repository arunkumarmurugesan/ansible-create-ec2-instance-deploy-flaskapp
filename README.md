# ansible-create-ec2-instance-deploy-flaskapp

Part 1: 

We should have a ec2 instance up and running before deploying the application hence initate the ec2 creation by modifying variable files

Variable File: ec2/group_vars/all
  
    region: 'us-west-1'
    ssh_key: 'sg_demo_key'
    aws_vpc_id: 'vpc-xxx'
    security_group: 'sg_demo_sg'
    project_name: 'prod_sg_demo'
    env: 'prod'
    instance_name: 'python_flask'
    ec2_instance_type: 't2.micro'
    ebs_volume_size: '20'
    vpc_subnet_id: 'subnet-4fdcd8sd'
    office_ip: '103.68.145.343/32'
    
Change the value according to your requirement. In case if you want additional package which needs to be installed while the server boot modify the user_data.sh.

Execute ec2 playbook. 

git clone https://github.com/arunkumarmurugesan/ansible-create-ec2-instance-deploy-flaskapp.git
cd ec2
ansible-playbook main.yml -v

Post execution, you might see the aws private key and host inventory file generated inside ec2 directory. 

Part 2: 

Now, the instance is up and running.Lets begin to deploy the application.

cd deploy_application

ansible-playbook main.yml ../ec2/aws_sg_demo_private.pem -v

This playbook excution will perform below tasks.
  1. Install the required package.
  2. Create an application user.
  3. Git clone the code repo.
  4. Set the timezone to UTC.
  5. Run the application in supervisor.
  6. Logrotation for application logs.
  
Now access the application from http://ipaddressoftheinstance:5000
