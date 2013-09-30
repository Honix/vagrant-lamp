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
- $ vagrant plugin install vagrant-omnibus

The box used in this repo comes from vagrantbox.es

I added omnibus because I was getting multiple error during provisioning. It seems that if you force the chef-solo version this problems disapears. I've set it to 11.6.0 but maybe we can update this version when new release will be out.

### VirtualBox

https://www.virtualbox.org/wiki/Downloads

Provisioning
============
Sometimes provision are not working. If you relaunch vagrant provision it happen to work after multiple retries. But this is definitly not a good way to do. Here is some bug I got and how I resolved them:

### MySQL cookbook
During the setup the cookbook 3.0.4 for MySQL try to connect before the server is runing. This trow this error: `Error executing action 'restart' on resource 'execute[mysql-install-privileges]`
The workaround is to add `ignore_failure true` under the line (198 for me) containing `subscribes :run, resources("template[#{grants_path}]"), :immediately`
Be careful, there is this line multiple times because the cookbook is build for all platform. So in our case you need to edit the Linux part.

Accessing MySQL from the host
=============================
It's a bit tricky. If you leave the MySQL cookbook by default it will use a bind_address on something like 10.0.2.15.
I've forced this address to be 127.0.0.1 in the vagrantfile.

Now for accessing the database from MySQL Workbench you can set the connection :

 - Standard TCP/Ip over SSH

 - SSH Hostname: localhost:2222
 - SSH Username: vagrant
 - SSH Password: vagrant
 - SSH Key File: %homedir%\.vagrant.d\insecure_private_key
 - MySQL Hostname: 127.0.0.1 (We could use 10.0.2.15 but you have to remember it, now it's simplier)
 - MySQL Server Port: 3306
 - Username: root
 - Password: password (this is set in the vagrantfile)

 VirtualHost
 ===========
 Work in progress

 I've added `127.0.0.1 vagrant.dev` in my `%windir%/system32/drivers/etc/hosts` file.
 Then if you try to connect to `http://vagrant.dev:8080` it leads you to your vagrant apache.
 But now I'm trying to create vhost for laravel.

TODO
======
- [X] Use Berkshelf
- [X] Open MySQL for accessing it from outside the box (MySQL Workbench)
- [ ] Configure VirtualHosts for laravel projects (set the docroot to myapp/public)
- [ ] Install MongoDB
- [ ] Install G-WAN server instead of Apache


