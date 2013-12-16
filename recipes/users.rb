mysql_connection_info = {
	:host     => 'localhost',
    :username => 'root',
    :password => node[:db][:server_root_password]
}

if node[:db][:users]

	node[:db][:users].each do |u|
		name = ! u.include?('name') ? u : u['name']

		mysql_database_user name do
			connection mysql_connection_info
			password '' unless u['password']
			database_name u['db'] if u['db']
			host '' unless u['host']
			action [:grant, :create] unless u['action']
		end
	end

end
