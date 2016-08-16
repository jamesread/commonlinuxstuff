class commonlinuxstuff::jenkins {
  yumrepo { "jenkins":
    baseurl => 'http://pkg.jenkins.io/redhat',
    descr => 'Jenkins',
    enabled => 1,
    gpgcheck => 0
  } ->

  package { 'jenkins':
    ensure        => installed,
    allow_virtual => true
  } ->

  service { 'jenkins':
    enable => true
  }
}
