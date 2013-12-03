default[:db][:server_root_password] = ''

default[:db][:remove_test_database] = true
default[:db][:root_network_acl] = true
default[:db][:remove_anonymous_users] = true
default[:db][:allow_remote_root] = true
default[:db][:data_dir] = "/var/lib/mysql"

node.set_unless[:mysql][:server_debian_password] 	= node[:db][:server_root_password]
node.set_unless[:mysql][:server_root_password] 		= node[:db][:server_root_password]
node.set_unless[:mysql][:server_repl_password] 		= node[:db][:server_root_password]

normal[:mysql][:remove_test_database] 	= node[:db][:remove_test_database]
normal[:mysql][:root_network_acl] 		= node[:db][:root_network_acl]
normal[:mysql][:remove_anonymous_users] = node[:db][:remove_anonymous_users]
normal[:mysql][:allow_remote_root] 		= node[:db][:allow_remote_root]
normal[:mysql][:data_dir] 				= node[:db][:data_dir]