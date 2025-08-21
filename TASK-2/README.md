# GitLab CI/CD Pipeline for Java Application Deployment

## Overview

This project sets up a GitLab CI/CD pipeline that automates building, Dockerizing, and deploying a Java-based application securely to a server via a self-hosted GitLab runner on a VM.

The application is exposed on port 80 and can be accessed at:  
http://52.66.235.163/

---

## Pipeline Stages

### 1. Build

- Updates the Ubuntu VM packages.
- Installs Docker, Java (default-jdk), and Maven.
- Builds the Java application using `mvn clean package -DskipTests`.

### 2. Docker Build

- Lists current files and Docker images for verification.
- Builds a Docker image tagged as `dhairyashil/knovator:6`.
- Cleans up dangling Docker images.
- Lists Docker images again to confirm the build.

### 3. Docker Push & Run

- Authenticates with Docker Hub using secured environment variables (`$DOCKERHUB_USERNAME` and `$DOCKERHUB_PASSWORD`).
- Pushes the Docker image to Docker Hub repository.
- Runs the Docker container detached, mapping host port 80 to container port 8080 for the app exposure.

---

## GitLab CI/CD Configuration Snippet

