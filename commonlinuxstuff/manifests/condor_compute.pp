# A condor compute node.
class commonlinuxstuff::condor_compute {
  package { 'condor':
    ensure        => installed,
    allow_virtual => true
  }
}
