class jwrpuppetmodule::pacemaker-corosync {
	package { ["corosync", "pacemaker", "pcs"]:
		ensure => installed
	}
}
