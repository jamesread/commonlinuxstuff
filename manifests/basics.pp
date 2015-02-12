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
					package { ["iptables", "iptables-services", "iptables-utils" ]:
						ensure => "installed"
					}
				}
			}
		}
	}

	/** iptables **/
	package { "iptables":
		ensure => "installed"
	} -> 

	package { "firewalld": 
		ensure => "purged"
	} -> 

	firewall { "22 ssh":
		proto => tcp,
		port => 22,
		action => accept
	}

	package { ["vim-enhanced", "elinks", "ntp", "git", "wget"]:
		ensure => "installed"
	} -> 

	exec { "update-profile":
			command => "/usr/bin/wget http://jwread.com/var/nix/profile.txt -O /root/.bashrc"
	}

	service { ["ntpd", "iptables"]:
		enable => true 
	}
}
