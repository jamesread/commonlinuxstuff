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
    package { 'firewalld':
      ensure        => 'installed',
      allow_virtual => true
    } ->

    firewalld_service { 'Allow SSH from the external zone':
      ensure  => 'present',
      service => 'ssh',
      zone    => 'external'
    }

    firewalld_service { 'Allow ping':
      ensure  => 'present',
      service => 'icmp',
      zone    => 'external'
    }

    service { 'firewalld':
      enable => true
    }
  }

  package { ['vim-enhanced', 'elinks', 'ntp', 'git', 'wget', 'unzip', 'psmisc', 'htop']:
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
