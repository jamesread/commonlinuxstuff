class jwrpuppetmodule::owncloud {
	package { "owncloud": 
		ensure => installed
	}

	service { "firewalld":
		ensure => stopped,
		enable => false
	}

	service { "mysqld" :
		ensure => running,
		enable => true
	} ->

	exec { "create database":
		path => "/usr/bin",
		command => "mysql -u root -e 'CREATE DATABASE owncloud'",
		unless => "mysql -u root -e 'USE owncloud' "
	} ->

	file { "/var/www/html/data/":
		ensure => directory,
		owner => "apache",
		group => "apache",
		mode => "0770"
	} ->

	file { "autoconfig":
		owner => "apache",
		group => "apache",
		path => "/usr/share/owncloud/config/autoconfig.php",
		content => '<?php $AUTOCONFIG = array("dbtype" => "mysql", "dbname" => "owncloud", "dbuser" => "root", "dbpass" => "", "dbhost" => "localhost", "dbtableprefix" => "", "adminlogin" => "root", "adminpass" => "password", "directory" => "/var/www/html/data" ); ?>'
	} -> 

	exec { "Cant be arsed to do it properly.":
		path => "/usr/sbin",
		command => "setenforce 0"
	}


	file_line { "Apache 2.4 allow":
		path => "/etc/httpd/conf.d/owncloud.conf",
		line => "Require all granted",
		match => "Require "
	} ->

	service { "httpd":
		ensure => running,
		enable => true
	} ->

	file { "index":
		path => "/var/www/html/index.html",
		ensure => file,
		content => '<a href = "/owncloud">Owncloud</a>'
	}
}