class jwr-puppet-module::pacemaker-corosync {
	package { ["corosync", "pacemaker", "pcs"]:
		ensure => installed
	}
}
