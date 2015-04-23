class commonlinuxstuff::dns {
	package { ["bind"]:
		ensure => installed
	}
}
