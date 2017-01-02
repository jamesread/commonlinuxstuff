# Install Pacemaker and Corosync.
class commonlinuxstuff::pacemaker_corosync {
  package { ['corosync', 'pacemaker', 'pcs']:
    ensure        => installed,
    allow_virtual => true
  }
}
