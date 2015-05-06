class commonlinuxstuff::lamp {
	package { ["httpd", "mariadb-server", "php", "php-pdo" ]: 
		ensure => installed,
		allow_virtual => true
	} ->

	service { ["httpd", "mariadb"]:
		ensure => running,
		enable => true
	} ->

	firewall { "500 httpd":
		proto => tcp,
		port => 80,
		action => accept
	}

}
