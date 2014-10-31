class jwr-puppet-module::lamp {
	package { ["httpd", "mariadb-server", "php"]: 
		ensure => installed
	} ->

	service { ["httpd", "mysqld"]:
		ensure => running,
		enable => true
	} ->

	firewall { "500 httpd":
		proto => tcp,
		port => 80,
		action => accept
	}

}
