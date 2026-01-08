**ABC Technologies – CI/CD DevOps Project**

Overview

This project implements an end-to-end CI/CD pipeline for a Java-based web application, demonstrating how code moves from source control to a running, monitored system using modern DevOps practices.

The focus is on automation, traceability, and separation of concerns across build, deployment, and monitoring stages.



Tech Stack
	•	CI/CD: Jenkins (master–agent)
	•	Build: Maven
	•	Containerisation: Docker, Docker Hub
	•	Deployment: Ansible, Kubernetes
	•	Infrastructure: AWS EC2
	•	Monitoring: Prometheus, Grafana
	•	App Server: Apache Tomcat
	•	Language: Java



What This Project Covers

CI/CD
	•	Separate Jenkins jobs for compile, test, and package
	•	Master–agent setup for workload distribution and job traceability

Application Validation
	•	WAR deployed directly to Tomcat before containerisation to isolate application issues early

Containerisation & Deployment
	•	Docker image built from validated WAR
	•	Image deployed to Kubernetes using Ansible-driven automation
	•	Application exposed via Kubernetes Service (NodePort)

Monitoring
	•	Node Exporter for system metrics
	•	Prometheus scraping
	•	Grafana dashboards for CPU, memory, and node health


  Notes

This project is scoped for learning and demonstration.
In a production environment, this would be extended with:
	•	Infrastructure as Code (Terraform)
	•	Secrets management
	•	Multiple environments (dev/staging/prod)
	•	Ingress + TLS
	•	Application-level monitoring and alerts



Context

Built as part of the Purdue Post Graduate Program in DevOps, with emphasis on real-world CI/CD workflows rather than tool-only demos.
