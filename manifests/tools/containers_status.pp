define mv_lxc::tools::containers_status($ensure = "running") {

	require('mv_lxc')
	require('mv_lxc::packages')
	
	# if containers should be running, 
	if ($ensure == "running") {
		
		
		case $::operatingsystem {

			'Debian': {
				# put 1 in lxc_container/autostart file to start it at boot
				file { "${mv_lxc::params::lxc_containers_directory}/${name}/autostart":
					ensure => file,
					content => "1",
				}
			} # end debian
		
	    'Ubuntu': {
				file { "/etc/lxc/auto/${name}.conf":
					target => "/var/lib/lxc/${name}/config",
					ensure => 'link',
				}
	    }
		
	    default: {
	      fail("Class lxc does not support ${::operatingsystem}")
	    }		
		} # end case OS
		
		
		# start container if not running
		exec { "${name}_start":
			command => "/usr/bin/lxc-start -d -n ${name}",
			unless => "/usr/bin/lxc-info -n ${name} | grep RUNNING",
		}
	}
	
	# if containers should be stopped
	else {
		
		# stop container if not stopped
		exec { "${name}_stop":
			command => "/usr/bin/lxc-stop -n ${name}",
			unless => "/usr/bin/lxc-info -n ${name} | grep STOPPED",
		}
		
		case $::operatingsystem {

			'Debian': {
				file { "${mv_lxc::params::lxc_containers_directory}/${name}/autostart":
					ensure => absent,
				}	
			} # end debian
		
	    'Ubuntu': {
				file { "/etc/lxc/auto/${name}.conf":
					ensure => absent,
				}
	    }
		
	    default: {
	      fail("Class lxc does not support ${::operatingsystem}")
	    }		
		} # end case OS
		 

	}
	
}