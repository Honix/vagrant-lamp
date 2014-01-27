vagrant-lamp
============

A Vagrant configuration for development with Apache-MySQL-PHP on a ubuntu 32bits server (precise32).
It uses [Chef](http://www.opscode.com/chef/) as provisionner. And [Berkshelf](http://berkshelf.com/) as a chef-cookbooks manager.

This is a work in progress.

Dependencies
============

### Git
http://git-scm.com/downloads


### Vagrant
- Install the client from vagrantup.com (On windows, don't use c:\program files !!! Use C:\Vagrant instead)
- $ vagrant plugin install vagrant-berkshelf

The box used in this repo comes from vagrantbox.es

### VirtualBox

https://www.virtualbox.org/wiki/Downloads

Accessing MySQL from the host
=============================
It's a bit tricky. If you leave the MySQL cookbook by default it will use a bind_address on something like 10.0.2.15.
I've forced this address to be 127.0.0.1 in the vagrantfile.

Now for accessing the database from MySQL Workbench you can set the connection :

 - Standard TCP/Ip over SSH

 - SSH Hostname: localhost:2222 (or 127.0.0.1:2222 if localhost doesn't work)
 - SSH Username: vagrant
 - SSH Password: vagrant
 - SSH Key File: %homedir%\.vagrant.d\insecure_private_key
 - MySQL Hostname: 127.0.0.1 (We could use 10.0.2.15 but you have to remember it, now it's simplier)
 - MySQL Server Port: 3306
 - Username: root
 - Password: password (this is set in the vagrantfile)

TODO
======
- [X] Use Berkshelf
- [X] Open MySQL for accessing it from outside the box (MySQL Workbench)
- [ ] Install Composer (is it usefull??? We can use it on the host no?)
- [ ] Install MongoDB
- [ ] Install G-WAN server instead of Apache


