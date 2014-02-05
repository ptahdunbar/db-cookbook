Chef::Log.info '[db] platform: MariaDB'

include_recipe 'mariadb::repo'
include_recipe 'mysql::ruby'
include_recipe 'mariadb::client'
include_recipe 'mariadb::server'
