# DevSecOps
## _Capstone Project, Grp 3 (Quintet)_ 
### _Project Name: To Be Decide_
### _Date: To Be Decide_
### _Author(s):_
- Ang Kok Beng
- Joseph Ong
- Lim Wei Jie
- Muhammad Rudyn
- Sagar Ingale
____________________________________________________________
## _Introduction_
This README.md details the implementation of a DevSecOps approach for the [To Be Decided] project. It outlines the methodologies, tools, and outcomes achieved by integrating development, security, and operations processes throughout the software development lifecycle (SDLC).
## _Methodology_
_Our project adopted the following DevSecOps practices:_ 
**Please update if missed out**

- **Shift Left Security:** Security considerations were integrated from the initial planning stages, ensuring early identification and mitigation of vulnerabilities.
- **Continuous Integration and Continuous Delivery (CI/CD):** An automated pipeline was established to continuously integrate code changes, run security scans, and deploy builds to testing and production environments.
- **Infrastructure as Code (IaC)**: Infrastructure configurations were managed as code, enabling consistent and secure deployments across environments.
- **Security Automation:** Security testing tools were integrated into the CI/CD pipeline to automate vulnerability scanning and penetration testing.
- **Collaboration and Communication:** Regular communication and collaboration between development, security, and operations teams were fostered to ensure alignment and address security concerns promptly.

## _Tools and Technologies_
_Our project utilized various tools and technologies to support the DevSecOps approach:_ **Please update if missed out**

- **Computing platform & services:** [AWS Cloud, S3 buckets, ACM, ACL, SSM, OAI, Cloudfront, Route53 ... ]
- **Version control system (VCS):** [GitHub]
- **CI/CD pipeline tool:** [GitHub Action] 
- **Security scanning tools:** [OWASP top 10, Checkov, Snyk]
- **Static Application Security Testing (SAST):** [Snyk]
- **Dynamic Application Security Testing (DAST):** [Snyk] 
- **Infrastructure Security Scanning:** [Checkov & Snyk] 
- **IaC tools:** [Terraform] 
- **Communication platforms:** [Slack, Zoom, Microsoft Team]

## _Outcomes_
_The implementation of DevSecOps resulted in several positive outcomes:_

- **Improved security posture:** Early identification and remediation of vulnerabilities throughout the SDLC significantly reduced security risks.
- **Faster time to market:** Automated testing and deployment processes accelerated software delivery timelines.
- **Enhanced collaboration:** Continuous communication and shared ownership of security fostered a collaborative and efficient development environment.
- **Increased operational efficiency:** Infrastructure automation streamlined deployments and reduced manual configuration errors.

## Challengers and Lessons Learned

_Challenger(s) encountered:_

- **Initial integration complexity:**
Integrating security tools and processes into existing workflows required initial effort and adaptation.
- **Cultural shift:**
Fostering a culture of shared security responsibility across development, security, and operations teams took time and ongoing communication. Messy start

## Conclusion
The DevSecOps approach successfully enhanced the security, efficiency, and collaboration within the [Project Name] project. By integrating security considerations throughout the SDLC and leveraging automation tools, the project achieved faster delivery times, improved security posture, and streamlined operations. The lessons learned from this project will be valuable for future endeavors, fostering a secure and efficient software development environment.

## Next Steps
**The project team will continue to:**

- Refine and improve the DevSecOps pipeline for increased efficiency and effectiveness.
- Foster a continuous learning culture to stay updated on emerging security threats and best practices.
- Explore opportunities to expand the DevSecOps approach to other projects within the organization.



In progress..
____________________________________________________________
DevSecOps is the seamless integration of security with two other disciplines: devlopment and operations. Main purpose is to build security into the Continuous Integration and Continuos Delivery (CI/CD) pipeline. Enabling fast and secure software releases, while rapidly detecting and responding to security flaws (vulnerabilities - such as Cross-site Scriping, Broken Access Control, SQL Injection, Insecure Sesign, Poor Data Sanitization and others mentioned in OWASP).


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

### Visual Studio Code (VSCode) 
Using VSCode, a free and open-source source code editor provides a rich set of features for coding, debugging and version control. It is highly customisable through its extensive library of extensions, enable tailoring with several Command-Line Interface (CLI)   

- Terraform CLI
- AWS CLI
- Git CLI
- 
- 

### Git + Github (Version control system)
Using Git as a version control system that tracks changes to files while GitHub as a web-based platform that hosts Git repositories and provides collaboration features for developers.

Create a new repositories on GitHub (remote) 

Assign appropriate access to the group members as collaborators based on their role, work with Pull Request & Merging

Use Secret manager to store sensitive information


### Terraform (Provision of infrasture)
Using Terraform in CI/CD pipelines is a common practice for automating infrastructure provisioning and management. Write the Terraform script to be used in the CD pipeline
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
Write CI and CD pipeline script for automated deployment and updates when ever a pull request [*push to main branch] is allowed

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

# Test
26 Feb 2024 @9.08PM by Raymond















