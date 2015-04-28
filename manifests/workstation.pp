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
		'gdb'
		]: 
		ensure => installed,
		allow_virtual => true
	}
}
