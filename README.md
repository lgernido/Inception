## 🖥️ General Information

The goal of this project is to get introduced to Docker and its functionnalities.

## 🧠 What is Docker ? 

Docker is a platform that allows you to package applications and their dependencies into containers, which are lightweight, portable, and can run consistently across different environments. 
It simplifies the process of developing, testing, and deploying applications, ensuring that they work the same way regardless of where they are run.

For this project, we will package 3 services in what we call containers. 
Containers are isolated environments that allow you to run an application along with all its dependencies, without interfering with the underlying operating system. 
They are lightweight, fast, and portable, making it easier to deploy them across different machines.

Docker Compose is a tool that allows you to define and manage multiple Docker containers in a single configuration the ```docker-compose.yml``` file. 
It simplifies the management of projects with several services (like a database, a web server, and an app) by allowing you to start, stop, and configure them together easily.

All the services will have their own images that are built with a Dockerfile.

# 🌐 Nginx

The first service that we configure in this project is **nginx**

Nginx is a high-performance web server and reverse proxy server used to serve web pages, handle requests, and distribute traffic efficiently. 
It is known for its ability to handle a large number of concurrent connections, making it ideal for serving static content and acting as a load balancer or proxy for dynamic applications
Using Nginx with Docker on a VM is a common approach for efficiently managing and deploying applications.

With this service, we implement the Transport Layer Security (TLS) in Nginx configuration to secure communication between the server and clients by encrypting the data transmitted over the network. 
Enabling TLS with Nginx improves security, trust, and compliance with industry standards for data protection.

In the **Nginx Image**, we hence generate a certification and a key to sign the certification in order to prove the server is secure. This is how we will be able to connect through ```https``` instead of ```http```.

# 🗄️ MariaDB

The second service that we configure in Inception is **MariaDB**

MariaDB is an open-source relational database management system that is a fork of MySQL. It is designed to be fully compatible with MySQL, meaning you can use it as a drop-in replacement. 
MariaDB offers improved performance, additional features, and enhanced security, while maintaining the same structure and functionality as MySQL for ease of use in database applications. 

# ✍️ Wordpress

The last container is **Wordpress**

WordPress is an open-source content management system used to create and manage websites. 
It is user-friendly, allowing users to build websites without needing extensive coding knowledge. 
WordPress offers a wide range of themes, plugins, and tools for customization, making it suitable for everything from blogs to e-commerce sites. 

In this project, we configure Wordpress with php-fpm in the same container.

## 🔗 Docker-compose 

All the containers work together through the ```docker-compose.yml``` file. It builds the images for the 3 services and also initializes the volumes necessary as well as
the ```docker-network``` that links the 3 containers. In order for the containers to communicate properly, we open different ports for the services.

Nginx -> 443

MariaDB -> 3306

Wordpress -> 9000

## 📂 Project structure 
<img src = https://github.com/lgernido/Inception/blob/main/Screenshot%20from%202025-02-25%2013-25-13.png>
