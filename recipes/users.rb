include_recipe 'db::connection'

if node[:db][:users]

	node[:db][:users].each do |u|
		name = ! u.include?('name') ? u : u['name']

		mysql_database_user name do
			connection mysql_connection_info
			password '' unless u['password']
			database_name u['db'] if u['db']
			action [:grant, :create] unless u['action']
		end
	end

end
