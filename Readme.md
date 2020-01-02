## Servian Project

## Pre-requisities
- Jenkins Server with terraform installed on it

## Description   
This project is used to display the number of visits on web server(Flask). This data is stored in database server Redis.

## Tools Used :
  - Jenkins
  - Terraform
  - Docker
  - Docker-compose
  - AWS EC2
  - Github
  
 ## Project Flow
 
 1. We have created Github repository and stored code in it.
 2. Jenkins server is setup to pull code from Github repository (poll scm).
 3. Jenkins build is configured to provision infrastructure (EC2) and install Docker, Docker-compose on the new host.
 4. Once build succeeds, jenkins will invoke Docker-compose to build and deploy containers (python application with Flask and Redis)
 5. Once containers are up and running, we can access public ip of host machine to see the number of visits on it.
 
