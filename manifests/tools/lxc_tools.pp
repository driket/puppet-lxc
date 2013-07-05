define mv_lxc::tools::lxc_tools (
	$install_directory = $mv_lxc::params::lxc_tools_directory,
) {
		
	require('mv_lxc')
	require('mv_lxc::packages')

	# CREATE LXC TOOLS DIRECTORIES
  file { "${install_directory}": 
      ensure 	=> directory,
      mode		=> "0644",
      owner 	=> 'root',
      group 	=> 'root',
  }
	
  file { "${install_directory}/templates": 
      ensure 	=> directory,
      mode 		=> "0644",
      owner 	=> 'root',
      group 	=> 'root',
			recurse => true,
  }
	
	# puppet
	file { "${install_directory}/deploy_puppet_to_container.sh": 
  	ensure => file,
    mode => "0700",
    owner => 'root',
    group => 'root',
		content => template("mv_lxc/deploy_puppet_to_container.sh.erb"),
		require => File["$install_directory"],
  }	
	
  file { "${install_directory}/templates/install_puppet_client.sh": 
  	ensure => file,
    mode => "0700",
    owner => 'root',
    group => 'root',
		content => template("mv_lxc/templates/install_puppet_client.sh.erb"),
		require => File["$install_directory/templates"],
  }	
	
  file { "${install_directory}/templates/puppet": 
  	ensure => file,
    mode => "0644",
    owner => 'root',
    group => 'root',
		content => template("mv_lxc/templates/puppet.erb"),
		require => File["$install_directory/templates"],
  }	
	
  file { "${install_directory}/templates/puppet.conf": 
  	ensure => file,
    mode => "0644",
    owner => 'puppet',
    group => 'puppet',
		content => template("mv_lxc/templates/puppet.conf.erb"),
		require => File["$install_directory/templates"],
  }	
}