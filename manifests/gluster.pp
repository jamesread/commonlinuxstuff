class commonlinuxstuff::gluster {
	package {[ 
		'xfsprogs',
		"glusterfs", 
		'glusterfs-cli', 
		'glusterfs-server',
		'glusterfs-geo-replication',
		'glusterfs-fuse',
		"puppet-gluster"
		]:
		ensure => installed,
		allow_virtual => true
	}
}
