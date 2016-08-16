class commonlinuxstuff::condor-compute {
  package { 'condor':
    ensure        => installed,
    allow_virtual => true
  }
}
