## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

C:\Users\LoneSubs(tm)\Documents\SassonBUCSD\Images\SassonServerDiagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - elkify.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network.

- Load balancers maintain the intregity of availability of a system's resources provided. The advantage of a jump box is that it is a gateway that must

passed in order to gain access to the DVWA's and ELK stacks.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems of the VMs on the network and system metrics.

- Filebeat watches and detects any changes to the filesystem.

- Metricbeat monitors changes in system metrics, such as SSH login attempts and CPU/RAM statistics.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    |Web Server| 10.0.0.5   | Linux            |
| Web-2    |Web Server| 10.0.0.6   | Linux            |
|ELK-Server|Monitoring| 10.1.0.4   | Linux            |
| Web-3    |Web Server| 10.0.0.7   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

-_107.204.158.136

Machines within the network can only be accessed by SSH.

-_The Jump Box machine has access to the ELK VM, its IP address is 168.62.195.26

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 107.204.158.136      |
|   ELK    | No                  | 10.0.0.1-254         |
|   Web-1  | No                  | 10.0.0.1-254         |
|   Web-2  | No                  | 10.0.0.1-254         |
|   Web-3  | No                  | 10.0.0.1-254         |
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

-_Ansible expedites and ensures that configurations are installed correctly while performing on multiple networks simultaneously, saving time as well.

The playbook implements the following tasks:

-_Installs docker.io, which is used to configure the ELK VM

-_Installs python3 and a module for compatibility with docker.io, while increasing system memory allocated to the ansible-playbook

-_Once those prerequisities are met, downloads and lauches a docker elk container under specific ports.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

 /Images/docker_ps.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

-_Web-1 & Web-2 VMs @ 10.0.0.5 & 10.0.0.6 respectively

We have installed the following Beats on these machines:

-_Filebeat, Metricbeat, and Packetbeat

These Beats allow us to collect the following information from each machine:

-_Filebeat collects changes from a filesystem to be stored as Apache logs

-_Metricbeat collects system metrics and login attempts as logs

-_Packetbeat collects packets that pass through NIC to generate a trace of all activity into a log or pcap

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

-_Copy the ansible-playbook file to the Jump Box Provisioner.

-_Update the hosts file to include the IPs of the webservers we want modified.

-_Run the playbook, and navigate to curl http://40.117.140.33:5601/app/kibana#/home to check that the installation worked as expected.

- _Which file is the playbook? Where do you copy it?_

-_pentest.yml is the playbook, you copy it to /etc/ansible/files once ansible is installed.

-_Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_

-_You would update the /etc/ansible/hosts , you would make a seperate 'hosts' group for [elkservers] as opposed to the filebeat install on [webservers]

- _Which URL do you navigate to in order to check that the ELK server is running?
-  http://40.117.140.33:5601/app/kibana#/home
