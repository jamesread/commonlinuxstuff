class commonlinuxstuff::basics {
	info("OS: $operatingsystem :: $operatingsystemrelease ")

	case $operatingsystem {
		'Fedora': 
		{
			case $operatingsystemrelease {
				'19', '20', '21':
				{
					package { ["vim-jedi", "vim-nerdtree"]: 
						ensure => installed,
						allow_virtual => true
					}
				}
			}

		}

		'CentOS', 'RedHat': 
		{
			case $operatingsystemmajrelease {	
				'7':
				{
					package { ["iptables-services", "iptables-utils" ]:
						ensure => "installed",
						allow_virtual => true
					}
				}
			}
		}
	}

	/** iptables **/
	package { "iptables":
		ensure => "installed",
		allow_virtual => true
	} -> 

	package { "firewalld": 
		ensure => "purged",
		allow_virtual => true
	} -> 

	firewall { "0 related":
		proto => all,
		state => ['RELATED', 'ESTABLISHED'],
		action => 'accept'
	}

	firewall { "0 icmp":
		proto => 'icmp',
		action => 'accept',
	}

	firewall { "1 loopback interface":
		proto => 'all',
		iniface => 'lo',
		action => 'accept'
	}

	firewall { "22 ssh":
		proto => 'tcp',
		port => 22,
		action => 'accept'
	}

	package { ["vim-enhanced", "elinks", "ntp", "git", "wget", "htop"]:
		ensure => "installed",
		allow_virtual => true
	} -> 

	exec { "update-profile":
			command => "/usr/bin/wget http://jwread.com/var/nix/profile.txt -O /root/.bashrc"
	}

	service { ["ntpd", "iptables"]:
		enable => true 
	}
}
