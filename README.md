# CapstoneProject-DevSecOps Grp 3 (Quintet)
Deploy a static website for wellness client in various region.
Implement security measures 
https://dynamics.sctp-sandbox.com/

Slides for presentation:
--URL--
____________________________________________________________
## Team consist of:
- Ang Kok Beng
- Joseph Ong
- Lim Wei Jie
- Muhammad Rudyn
- Sagar Ingale
____________________________________________________________
## Scenario
You are working in a unicorn startup and they are rapidly scaling their products to markets in several regions. Due to the market competition, security vulnerabilities screening has always been hindering the product release. You are tasked to turn the current DevOps Pipeline into DevSecOps. This means that you are to implement relevant security measures at each stage of the CICD Pipeline. In this project, you will be required to set up a simple CICD pipeline while focusing on the security measures introduced to it.

____________________________________________________________
## Getting Started (What)
To host a simple HTML file on an S3 static website, you can use a CI/CD pipeline to create an S3 bucket using Terraform. 
The newest index.html file from this GitHub repository can then be uploaded and automatically updated whenever there is a push to any branch.

____________________________________________________________
## CICD Pipeline (How)

### VS code 
Using VS Code as a platform
Enable the following
- Terraform CLI
- AWS CLI
- Git CLI
- 
- 

### Github (Version control)
Create a new repositories on GitHub 

Assign appropriate access to the group members as collaborators based on their role, work with Pull Request & Merging

Use Secret manager to store sensitive information


### Terraform (Provision of infrasture)
Write the Terraform script to be used in the CD pipeline
DevOps lifecycle check in local device
- Build
- Test 
- Deploy
- Operate
- Observe
- Continuous Feedback (If any)
- Discover
- Plan

Using Snyk to check for vulnerability in the code


### AWS (Hosting of website)
Create a static Web Application hosted in S3 
Enable and configure the following:
- S3 Policy + OAC (For access control from the web)
- IAM Role (For access control from GitHub action)
- Cloudfront WAF and Shield (Default enable)
- ACM (for seamless web surfing through SSL/TLS)

Create a bucket to store statefile.tf in S3


### GitHub Action
Write CI and CD pipeline script for automated deployment and updates when ever a pull request is allowed

The static webpages can be built, tests can be run, and the application can be deployed.

Using Snyk to check for vulnerability

____________________________________________________________
## Architecture Diagram

--Insert Diagram--


## Dependencies
- AWS S3 bucket
- Snyk
- Terraform


## Application steps (DevOps)

### workflow (Github action)

### S3 Bucket (HTML)


## Branching Strategies


## Security Steps (Sec)

### Github branch merge


### Security in AWS


### Secrets in Github


### S3 Bucket (Statefile)


### Vulnerability Scan




## Lesson Learnt 

## Debugging
Screen capture

## Area for Improvements

## Resources 















