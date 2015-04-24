class commonlinuxstuff::workstation {
	package {[
		'docker',
		'kde-plasma-folderview',
		'virt-manager',
		'workstation',
		]: 
		ensure => installed,
		allow_virtual => true
	}
}
