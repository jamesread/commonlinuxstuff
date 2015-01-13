class jwrpuppetmodule::lamp {
	package { ["httpd", "mariadb-server", "php"]: 
		ensure => installed
	} ->

	service { ["httpd", "mariadb"]:
		ensure => running,
		enable => true
	} ->

	firewall { "firewall for httpd":
		proto => tcp,
		port => 80,
		action => accept
	}

}
