class mv_lxc::service {

	service { "mv_lxc":
		name => $mv_lxc::service_name,
		#ensure => running,
		require => Package["mv_lxc"],
	}
}
