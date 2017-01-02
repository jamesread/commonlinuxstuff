# Install OwnCloud.
class commonlinuxstuff::owncloud {
  package { ['findutils', 'hostname', 'owncloud']:
    ensure        => installed,
    allow_virtual => true
  }

  service { 'firewalld':
    ensure => stopped,
    enable => false
  }

  service { 'mysqld' :
    ensure => running,
    enable => true
  } ->

  exec { 'create database':
    path    => '/usr/bin',
    command => "mysql -u root -e 'CREATE DATABASE owncloud'",
    unless  => "mysql -u root -e 'USE owncloud' "
  } ->

  file { '/var/www/html/data/':
    ensure => directory,
    owner  => 'apache',
    group  => 'apache',
    mode   => '0770'
  } ->

  file { 'autoconfig':
    owner  => 'apache',
    group  => 'apache',
    path   => '/usr/share/owncloud/config/autoconfig.php',
    source => 'puppet:///modules/files/owncloud_autoconfig.php'
  } ->

  exec { 'Cant be arsed to do it properly.':
    path    => '/usr/sbin',
    command => 'setenforce 0'
  }


  file_line { 'Apache 2.4 allow':
    path  => '/etc/httpd/conf.d/owncloud.conf',
    line  => 'Require all granted',
    match => 'Require '
  } ->

  service { 'httpd':
    ensure => running,
    enable => true
  } ->

  file { 'index':
    ensure  => file,
    path    => '/var/www/html/index.html',
    content => '<a href = "/owncloud">Owncloud</a>'
  }
}
