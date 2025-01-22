# Inception

**Inception** is a system administration project focused on building and managing a small infrastructure using Docker. The project introduces concepts of virtualization, containerization, and Docker orchestration to simulate a fully functional web hosting environment.

## Project Overview

The goal of this project is to set up and manage a multi-container Docker infrastructure that includes the following services:
- **Nginx**: A web server configured with TLSv1.2 or TLSv1.3.
- **WordPress**: A CMS with PHP-FPM, fully configured.
- **MariaDB**: A relational database for storing WordPress data.
- **Volumes**: 
  - One for the WordPress database.
  - One for WordPress website files.
- **Network**: A Docker network for seamless communication between containers.

## Features

- Infrastructure entirely managed by Docker Compose.
- TLS-secured entry point via Nginx (port 443 only).
- Customizable domain name (`<your-login>.42.fr`) pointing to the local IP.
- Fully isolated containers for each service.
- Environment variables and Docker secrets for secure configuration.
- Resilient design: containers restart automatically in case of failure.

## Requirements

- Docker and Docker Compose must be installed.
- The project must be deployed in a virtual machine.
- All containers are built from scratch using Dockerfiles (no pre-built images).

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/username/inception.git
   cd inception
   ```

2. Build and run the infrastructure:
   ```bash
   make
   ```

3. Access the services:
   - Open a browser and navigate to `https://<your-login>.42.fr`.

4. Manage the infrastructure:
   - Stop all containers: `make down`
   - Clean up: `make fclean`
   - Rebuild everything: `make re`

## Directory Structure

```
inception/
├── Makefile
├── secrets/
│   ├── credentials.txt
│   ├── db_password.txt
│   ├── db_root_password.txt
├── srcs/
│   ├── docker-compose.yml
│   ├── .env
│   └── requirements/
│       ├── mariadb/
│       │   ├── Dockerfile
│       │   └── conf/
│       ├── nginx/
│       │   ├── Dockerfile
│       │   └── conf/
│       ├── wordpress/
│           ├── Dockerfile
│           └── conf/
```

## Security

- Sensitive credentials and environment variables are stored in `.env` and `secrets/` (ignored by Git).
- TLS ensures secure communication between clients and the server.

## Bonus Features

If the mandatory part is completed flawlessly, the following bonuses can be added:
- Redis cache for WordPress.
- FTP server pointing to WordPress volumes.
- A static website built with any language except PHP.
- Adminer for database management.
- Additional useful services of your choice.

## Acknowledgments

This project is part of the 1337 curriculum and emphasizes hands-on system administration using Docker. It encourages learning best practices for containerization and infrastructure management.
