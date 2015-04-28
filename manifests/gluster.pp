class commonlinuxstuff::gluster {
	package { ["glusterfs", "puppet-gluster"]:
		ensure => installed,
		allow_virtual => true
	}
}
