# LAMP STACK USING ANSIBLE
![LAMP STACK](https://i2.wp.com/www.falconinternet.com/wp-content/uploads/2020/01/lamp-stack-1567223529136.jpg?resize=1110%2C550&ssl=1)
<p align="center">
  <img height="100" width="100" src="https://cdn5.vectorstock.com/i/1000x1000/73/49/plus-sign-symbol-simple-design-vector-25607349.jpg" alt="Plus Symbol"/><br>
  <img height="200" width="400" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1Z1lXkAdhInx4pyGsAR8wC3ldnBfGyg-psYNF2PrPpNymleZB8A&s" alt="Plus Symbol"/>
</p>


**What is LAMP Stack ?**

A LAMP Stack is a set of open-source software that can be used to create websites and web applications. LAMP is an acronym, and these stacks typically consist of the Linux operating system, the Apache HTTP Server, the MySQL relational database management system, and the PHP programming language.

**What is ansible ?**

Ansible is an open-source software provisioning, configuration management, and application-deployment tool. It runs on many Unix-like systems, and can configure both Unix-like systems as well as Microsoft Windows. It includes its own declarative language to describe system configuration.

**How ansible is useful in setting up lamp stack ?**

* Using ansible we can setup lamp stack within few minutes and deployed in various host.
* Using ansible in-built modules things are much simpler.
* Moreover, using ansible roles we can re-use the roles in different projects as well.

## Files present in repository

**LAMP-Stack-Without-Role.yml** - In this playbook i am not using ansible-roles concept if someone wants to run the playbook directly you can run the playbook direct using simple ansible-playbook command.

**ansible.cfg** - In this file describing only basic configuration settings such as path location and host checking settings.

**inventory.txt** - Host file where we can describe different host for deploying the LAMP Stack.

**lamp.yml** - Master role playbook where all the required roles are defined.

**roles** - Roles directory where different roles are defined such as for firewalld, database setup and configuration, database creation and user creation and web server setup roles.

### **Using KodeKloud PHP code for deployment**
- https://github.com/kodekloudhub/learning-app-ecommerce
