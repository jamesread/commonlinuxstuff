class commonlinuxstuff::pacemaker-corosync {
	package { ["corosync", "pacemaker", "pcs"]:
		ensure => installed
	}
}
