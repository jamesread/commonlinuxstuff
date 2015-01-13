class jwrpuppetmodule::basics {
	info("OS: $operatingsystem :: $operatingsystemrelease ")

	case $operatingsystem {
		'Fedora': 
		{
			case $operatingsystemrelease {
				'16', '17', '18': 
				{
					$firewall = "iptables"
				}
				'19', '20', '21':
				{
					package { ["vim-jedi", "vim-nerdtree"]: 
						ensure => installed 
					}

					$firewall = "firewalld"
				}
			}

		}

		'RedHat': 
		{
			case $operatingsystemrelease {
				'6.0': 
				{
					$firewall = "iptables"
				}

				'7.0':
				{
					$firewall = 'firewalld'
				}
			}
		}
	}

	info("Firewall: $firewall")

	package { ["vim-enhanced", "elinks", "ntp", "git"]:
		ensure => "installed"
	}

	exec { "update-profile":
			command => "/usr/bin/wget http://jwread.com/var/nix/profile.txt -O /root/.bashrc"
	}

	service { ["ntpd", $firewall]:
		enable => true 
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
