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

TODO
======
- [ ] Use Berkshelf
- [ ] Open MySQL for accessing it from outside the box (MySQL Workbench)
- [ ] Install Composer
- [ ] Install MongoDB
- [ ] Install G-WAN server instead of Apache


