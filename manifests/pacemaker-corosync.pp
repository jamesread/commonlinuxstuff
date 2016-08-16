class commonlinuxstuff::pacemaker-corosync {
  package { ['corosync', 'pacemaker', 'pcs']:
    ensure        => installed,
    allow_virtual => true
  }
}
