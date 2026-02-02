# Docker Fundamentals Repository

This repository is a **learning-reference** for
understanding Docker.
It covers **Dockerfile**, and **Docker Compose**, examples.

---

## 📦 What is Docker?

Docker is a platform that allows you to **build, package, and run
applications inside containers**.

### Why Docker?

- Consistent environments across development and production
- Lightweight compared to virtual machines
- Faster setup and deployment
- Easier collaboration

### Core Concepts

- **Image**: A blueprint for containers
- **Container**: A running instance of an image
- **Dockerfile**: Instructions to build an image
- **Docker Compose**: Tool to run multi-container applications

---

## 🐳 Docker Basics

### Common Commands

```bash
docker --version
docker images
docker ps
docker ps -a
docker run hello-world
```

### Running a Container

```bash
docker run -d -p 8080:80 nginx
```

Explanation: - `-d` : detached mode - `-p` : port mapping - `nginx` :
image name

---

## 🧱 Dockerfile

A **Dockerfile** defines how an image is built.

### Basic Structure

```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

### Common Instructions

- `FROM` -- base image
- `WORKDIR` -- working directory
- `COPY` -- copy files
- `RUN` -- execute commands
- `EXPOSE` -- open port
- `CMD` -- default command

### Build & Run

```bash
docker build -t myapp .
docker run -p 3000:3000 myapp
```

---

## 🔗 Docker Compose

Docker Compose is used to **define and run multi-container
applications**.

### Example: App + Database

```yaml
version: "3.9"

services:
  app:
    build: .
    ports:
      - "3000:3000"
    depends_on:
      - db

  db:
    image: postgres:15
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
      POSTGRES_DB: appdb
```

### Commands

```bash
docker compose up
docker compose up -d
docker compose down
```

---

## 🎯 Learning Goals

By using this repository, you should be able to: - Understand Docker
fundamentals - Build custom Docker images - Use Docker Compose for
multi-service apps - Apply Docker in real-world projects

---

## 📚 References

- https://docs.docker.com
- https://hub.docker.com

---
