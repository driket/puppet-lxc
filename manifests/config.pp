class mv_lxc::config {
	
	require('mv_lxc::packages')
	
	
	case $::operatingsystem {

		'Debian': {

			# nothing to do

		} # end debian
		
    'Ubuntu': {
			
			# nothing to do
    }
		
    default: {
			
      fail("Class lxc does not support ${::operatingsystem}")
    }		
	} # end case OS

}
