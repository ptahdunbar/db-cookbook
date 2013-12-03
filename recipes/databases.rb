
mysql_connection_info = {
	:host     => 'localhost',
    :username => 'root',
    :password => node[:db][:server_root_password]
}

if node[:db][:databases]

	node[:db][:databases].each do |db|
		name = ! db.include?('name') ? db : db['name']

		mysql_database name do
			connection mysql_connection_info
			action :create unless db['action']
			sql db['sql'] if db['sql']
		end
	end

end
