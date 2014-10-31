warning("OS: $operatingsystem :: $operatingsystemrelease ")

case $operatingsystem {
	'Fedora': 
	{
		case $operatingsystemrelease {
			'16', '17', '18': 
			{
				$firewall = "iptables"
			}
			'19':
			{
				package { "vim-jedi": ensure => installed }
				$firewall = "firewalld"
			}
		}

	}

	'RedHat': 
	{
		$firewall = "iptables"
	}
}

warning("Firewall: $firewall")

package { ["vim-enhanced", "elinks", "ntp", "git", "vim-nerdtree"]:
	ensure => "installed"
}

service { ["ntpd", $firewall]:
	enable => true 
}

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
