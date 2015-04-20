class commonlinuxstuff::gluster {
	package { ["glusterfs", "puppet-gluster"]:
		ensure => installed
	}
}
