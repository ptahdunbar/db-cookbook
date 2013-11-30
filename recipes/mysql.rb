
Chef::Log.info '[db] platform: MySQL'

::Chef::Recipe.send(:include, Opscode::Mysql::Helpers)

include_recipe 'mysql::client'
include_recipe 'mysql::ruby'
include_recipe 'mysql::server'

template '/etc/mysql/my.cnf' do
	source 'my.cnf.erb'
	owner 'root'
	group 'root'
	mode '0644'
	notifies :reload, 'service[mysql]'
end

#----
# Grants
#----
template '/etc/mysql_grants.sql' do
	source 'grants.sql.erb'
	owner  'root'
	group  'root'
	mode   '0600'
	notifies :run, 'execute[install-grants]'
end

cmd = install_grants_cmd
execute 'install-grants' do
  command cmd
  action :nothing
end