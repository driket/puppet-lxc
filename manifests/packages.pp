class mv_lxc::packages {

	package {"mv_lxc":
		name => $mv_lxc::package,
		ensure => present,
	}

}
