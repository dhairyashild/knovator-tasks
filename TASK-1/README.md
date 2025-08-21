RAECT FRONTEND: http://3.110.105.229/                       

                    
NODEJS BACKEND: http://3.110.105.229/api/                                       


## Overview

This project dockerizes a full-stack Node.js and ReactJS application using **multi-stage Docker builds** for lightweight production images. The app is hosted on an Ubuntu 20.04 server with Docker Compose and exposed via Nginx reverse proxy.

## Setup Steps

1. **Dockerize Node.js & ReactJS apps:**  
   - Created multi-stage Dockerfiles to build optimized and small images.  
   - Node.js backend and React frontend built separately, final frontend served via Nginx.

2. **Provision Ubuntu 20.04 server:**  
   - Used EC2 instance running Ubuntu 20.04 OS as the deployment environment.

3. **Install Docker & Docker Compose:**  
   - Installed Docker engine and Docker Compose on the server for container orchestration.

4. **Configure `docker-compose.yml`:**  
   - Defined services for backend, frontend, and Nginx reverse proxy with appropriate port mappings and dependencies.

5. **Run the application:**  
   - Built Docker images and started all containers using `docker-compose up -d`.  
   - Nginx serves as a reverse proxy forwarding frontend and backend requests correctly.

6. **Access your app:**  
   - The application is reachable via the server's IP or domain on configured ports.
     
FRONTEND: http://3.110.105.229/

BACKEND: http://3.110.105.229/api/


## Benefits

- Lightweight and production-ready containers using multi-stage builds.  
- Simplified deployment and scaling with Docker Compose.  
- Clean separation of backend, frontend, and proxy concerns.
