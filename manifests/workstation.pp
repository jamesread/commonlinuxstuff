class commonlinuxstuff::workstation {
	package {[
		'docker',
		'kde-plasma-folderview',
		'virt-manager',
		'gimp',
		'filezilla',
		'gvim',
		'overpass-fonts',
		'vlc',
		'cmake',
		'g++'
		]: 
		ensure => installed,
		allow_virtual => true
	}
}
