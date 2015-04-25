class commonlinuxstuff::workstation {
	package {[
		'docker',
		'kde-plasma-folderview',
		'virt-manager',
		'gimp',
		'filezilla'
		'gvim',
		]: 
		ensure => installed,
		allow_virtual => true
	}
}
