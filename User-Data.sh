#!/bin/bash
# Update & install prerequisites
apt-get update -y
apt-get upgrade -y

# Install Java (needed for Jenkins)
apt-get install openjdk-17-jdk -y

# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | apt-key add -
sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update -y
apt-get install jenkins -y
systemctl enable jenkins
systemctl start jenkins

# Install Docker
apt-get install docker.io -y
usermod -aG docker jenkins
usermod -aG docker ubuntu
systemctl enable docker
systemctl start docker

# Allow port 8080 and 5000
ufw allow 22
ufw allow 8080
ufw allow 5000
ufw --force enable

# Print Jenkins initial password to file
cat /var/lib/jenkins/secrets/initialAdminPassword > /home/ubuntu/jenkins-password.txt
chown ubuntu:ubuntu /home/ubuntu/jenkins-password.txt
