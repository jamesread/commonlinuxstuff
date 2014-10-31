class jwr-puppet-module::condor-compute {
	package { "condor": 
		ensure => installed
	}
}
