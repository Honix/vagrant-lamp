Vagrant.configure("2") do |config|

    ###### Precise32 is an Ubuntu 12.04
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    ###### Connect to localhost:8080 on the host machine to access the web server of the box
    config.vm.network :forwarded_port, host: 8080, guest: 80

    ###### VirtualBox configuration
    #config.vm.provider "virtualbox" do |vb|
    #    ###### Complete list of the settings for Virtualbox 
    #    ###### here : http://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm
    #    vb.customize ["modifyvm", :id, "--memory", "2048"]
    #end

    ###### Update the list of packages (You need to run apt-get upgrade-y via vagrant SSH)
#    config.vm.provision :shell, :inline => "sudo apt-get update -y"

    ###### Activate the Vagrant plugin Berkshelf. It manages the cookbooks from the berksfile for us.
    config.berkshelf.enabled = true

    ###### Privision   
    config.vm.provision "chef_solo" do |chef|
        chef.add_recipe "apt"
        chef.add_recipe "openssl"
        chef.add_recipe "apache2"
        chef.add_recipe "apache2::mod_php5"
        chef.add_recipe "apache2::mod_rewrite"
        chef.add_recipe "mysql"
        chef.add_recipe "mysql::server"
        chef.add_recipe "php"
        chef.add_recipe "php::module_mysql"
        chef.add_recipe "chef-php-extra::module_mcrypt"
                
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
