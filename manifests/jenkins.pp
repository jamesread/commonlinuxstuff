# Install Jenkins.
class commonlinuxstuff::jenkins {
  yumrepo { 'jenkins':
    baseurl  => 'http://pkg.jenkins.io/redhat',
    descr    => 'Jenkins',
    enabled  => 1,
    gpgcheck => 0
  } ->

  package { ['java', 'jenkins', 'httpd']:
    ensure        => installed,
    allow_virtual => true
  } ->

  file { 'autoconfig':
    owner  => 'apache',
    group  => 'apache',
    path   => '/etc/httpd/conf.d/jenkins-proxy.conf',
    source => 'puppet:///modules/files/jenkins-proxy.conf'
  } ->


  service { ['jenkins', 'httpd']:
    enable => true
  }
}
