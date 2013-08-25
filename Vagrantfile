Vagrant.configure("2") do |config|

    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    config.vm.network :forwarded_port, host: 8080, guest: 80
    
    config.vm.provision "chef_solo" do |chef|
        
        chef.cookbooks_path = "chef-solo/cookbooks"

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
                "server_root_password" =>  "iloverandompasswordsbutthiswilldo",
                "server_repl_password" =>  "iloverandompasswordsbutthiswilldo",
                "server_debian_password" => "iloverandompasswordsbutthiswilldo"
            }
        }

    end

end
