class mv_lxc::packages {

  package {'lxc':
    ensure => present,
  }
  package {'bridge-utils':
    ensure => present,
  }
  package {'debootstrap':
    ensure => present,
  }
  package {'rsync':
    ensure => present,
  }

}
