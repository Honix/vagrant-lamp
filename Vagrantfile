Vagrant.configure("2") do |config|

    ###### Precise is an Ubuntu 12.04
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config.vm.network "private_network", ip: "192.168.50.50"

    ###### Connect to localhost:8080 on the host machine to access the web server of the box
    config.vm.network "forwarded_port", guest: 80, host: 8080


    ###### Complete list of the settings for Virtualbox 
    ###### here : http://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm
    config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", "2048", "--ioapic", "on"]
        v.customize ["modifyvm", :id, "--name", "vagrant-lamp-chefsolo"]
    end

    ###### Update the list of packages (You need to run apt-get upgrade-y via vagrant SSH)
#    config.vm.provision :shell, :inline => "sudo apt-get update -y"

    ###### Activate the Vagrant plugin Berkshelf. It manages the cookbooks from the berksfile for us.
    config.berkshelf.enabled = true

#    config.hostmanager.enabled = true
#    config.hostmanager.manage_host = true
#    config.hostmanager.ignore_private_ip = false
#    config.hostmanager.include_offline = true
#    config.vm.define "precise64" do |node|
#        node.vm.hostname = "localhost"
#    end

    ###### This fixes some problems
    config.omnibus.chef_version = "11.6.0"

    ###### Provision   
    config.vm.provision "chef_solo" do |chef|
        chef.add_recipe "apt"
        chef.add_recipe "openssl"
        chef.add_recipe "apache2"
        chef.add_recipe "apache2::mod_php5"
        chef.add_recipe "apache2::mod_rewrite"
    #   chef.add_recipe "mysql"
        chef.add_recipe "mysql::server"
        chef.add_recipe "php"
        chef.add_recipe "php::module_mysql"
        chef.add_recipe "git" #this is a dependencie for chef-php-extra
        chef.add_recipe "chef-php-extra::module_mcrypt"
        chef.add_recipe "docker"
        #chef.add_recipe "mongodb::default"
        chef.add_recipe "vHost-cookbook"
                
        chef.json = { 
            "apache" => {
                "default_site_enabled" => true,
                "docroot_dir" => "/vagrant"
            },
            "mysql" => {
                "remove_test_database" => "true",
                "bind_address" => "127.0.0.1",
                "server_root_password" =>  "password",
                "server_repl_password" =>  "password",
                "server_debian_password" => "password"
            }
        }

    end
end
