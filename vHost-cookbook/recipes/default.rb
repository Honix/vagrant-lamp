include_recipe "apache2"

web_app "localhost" do
	server_name "localhost"
	docroot "/vagrant"
end

web_app "todo-list" do
	server_name "vagrant.todo-list"
	docroot "/vagrant/todo-list/public"
end

web_app "wardrobe" do
	server_name "vagrant.wardrobe"
	docroot "/vagrant/wardrobe/public"
end