# Basic packages I find essential, and firewall rules.
class commonlinuxstuff::basics {
  info("OS: ${::operatingsystem} :: ${::operatingsystemrelease} ")

  case $::operatingsystem {
    'Fedora': {
          package { ['vim-jedi', 'vim-nerdtree']:
            ensure        => installed,
            allow_virtual => true
          }
    }

    'CentOS', 'RedHat': {
      case $::operatingsystemmajrelease {
        '7': {
          package { ['iptables-services', 'iptables-utils' ]:
            ensure        => 'installed',
            allow_virtual => true
          }
        }

        default: {
          warn("RHEL version not recognized, won't install essential packages.")
        }
      }
    }

    default:
    {
      warn("OS not recognized, won't install essential packages.")
    }
  }

  $insideDocker = inline_template("<% if File.exist?('/.dockerenv') -%>true<% end -%>")
  
  if !$insideDocker {
    # iptables
    package { 'iptables':
      ensure        => 'installed',
      allow_virtual => true
    } ->

    package { 'firewalld':
      ensure        => 'purged',
      allow_virtual => true
    } ->

    firewall { '0 related':
      proto  => all,
      state  => ['RELATED', 'ESTABLISHED'],
      action => 'accept'
    }

    firewall { '0 icmp':
      proto  => 'icmp',
      action => 'accept',
    }

    firewall { '1 loopback interface':
      proto   => 'all',
      iniface => 'lo',
      action  => 'accept'
    }

    firewall { '22 ssh':
      proto  => 'tcp',
      dport  => 22,
      action => 'accept'
    }

    service { 'iptables':
      enable => true
    }
  }

  package { ['vim-enhanced', 'elinks', 'ntp', 'git', 'wget', 'unzip', 'psmisc']:
    ensure        => 'installed',
    allow_virtual => true
  } ->

  exec { 'update-profile':
      command => '/usr/bin/wget http://jwread.com/var/nix/profile.txt -O /root/.bashrc'
  }

  service { ['ntpd']:
    enable => true
  }
}
