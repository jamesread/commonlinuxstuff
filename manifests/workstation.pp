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
		'gcc',
		'gcc-c++',
		'gdb',
		'nodejs',
		'go',
		'eclipse',
		'eclipse-m2e-core',
		'eclipse-m2e-egit',
		'htop',
		'icedtea-web'
		]: 
		ensure => installed,
		allow_virtual => true
	}
}
