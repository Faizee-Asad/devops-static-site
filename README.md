# 🚀 DevOps CI/CD Pipeline for Static Website Deployment

This project demonstrates a complete DevOps workflow by deploying a static HTML website using *Jenkins, **Docker, and **AWS EC2*.

---

## 📌 Project Overview

A simple static HTML page is containerized using Docker with an Nginx base image. The project is deployed via a Jenkins pipeline hosted on an AWS EC2 Ubuntu server. Jenkins pulls the latest code from GitHub, builds the Docker image, stops the old container, and runs the new one — all automated through scripted CI/CD.

---

## 🛠 Tech Stack

- *AWS EC2* (Ubuntu 22.04)
- *Jenkins*
- *Docker*
- *Git & GitHub*
- *Nginx*
- *Shell Scripting*

---

## 📁 Project Structure
├── index.html         # Static website content 
├── Dockerfile         # Defines the container image using Nginx 
└── README.md          # Project documentation

---

## ⚙ Jenkins Pipeline Script

groovy
pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/Faizee-Asad/devops-static-site.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t static-site .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop static-site || true'
                sh 'docker rm static-site || true'
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d -p 8080:80 --name static-site static-site'
            }
        }
    }
}


---

📦 Dockerfile

FROM nginx:alpine
COPY ./index.html /usr/share/nginx/html/index.html


---

🧪 How to Run Locally

git clone https://github.com/Faizee-Asad/devops-static-site.git
cd devops-static-site
docker build -t static-site .
docker run -d -p 8080:80 --name static-site static-site

Visit: http://localhost:8080


---

🌐 Deployment Architecture

1. Launch EC2 (Ubuntu) and install Docker & Jenkins using cloud-init.


2. Clone this repo on Jenkins via a Pipeline job.


3. Jenkins builds and deploys the Docker container with every code push.




---

📝 Credits

Created by Faizee Asad
DevOps & Cloud Enthusiast
📧 [Optional Email]
🌐 [Optional LinkedIn or Portfolio Link]


---

📍 Live Demo

Visit your site at:
http://<your-ec2-ip>:8080
(If EC2 instance is running)


---

