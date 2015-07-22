class commonlinuxstuff::dns {
	package { ["bind"]:
		ensure => installed,
		allow_virtual => true
	}
}
