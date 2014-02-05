Chef::Log.info '[db] platform: MySQL'

::Chef::Recipe.send(:include, Opscode::Mysql::Helpers)

node.override[:mysql][:client][:packages] = %w[mysql-client libmysqlclient-dev]
node.override[:mysql][:server][:packages] = %w{mysql-server apparmor-utils}

include_recipe 'mysql::ruby'
include_recipe 'mysql::client'
include_recipe 'mysql::server'
