class commonlinuxstuff::workstation {
	package {[
		'docker',
		]
		ensure => installed
	}
}
