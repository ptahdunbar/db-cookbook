#
# Cookbook Name:: db
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

if node[:db][:platform]
	case node[:db][:platform]
	when 'mysql'
		include_recipe 'db::mysql'
	when 'mariadb'
		include_recipe 'db::mariadb'
	end
end

include_recipe 'db::databases'
include_recipe 'db::users'