class commonlinuxstuff::basics {
	info("OS: $operatingsystem :: $operatingsystemrelease ")

	case $operatingsystem {
		'Fedora': 
		{
			case $operatingsystemrelease {
				'19', '20', '21':
				{
					package { ["vim-jedi", "vim-nerdtree"]: 
						ensure => installed 
					}
				}
			}

		}

		'RedHat': 
		{
			case $operatingsystemrelease {
				'6.0': 
				{
				}

				'7.0':
				{
				}
			}
		}
	}

	package { "firewalld": 
		ensure => "purged"
	}

	package { ["vim-enhanced", "elinks", "ntp", "git", "iptables"]:
		ensure => "installed"
	}

	exec { "update-profile":
			command => "/usr/bin/wget http://jwread.com/var/nix/profile.txt -O /root/.bashrc"
	}

	service { ["ntpd", $firewall]:
		enable => true 
	}

	firewall { "22 ssh":
		proto => tcp,
		port => 22,
		action => accept
	}

/*
	exec { "puppet module install spiette-ssh":
	  path    => "/usr/bin:/usr/sbin:/bin",
	  onlyif  => "test `puppet module list | grep 'spiette-ssh' | wc -l` -eq 0"
	} ->

	class { "ssh":
		serveroptions => {
			'UseDNS' => 'no',
			'GSSAPIAuthentication' => 'no',
		}
	}
*/
}
