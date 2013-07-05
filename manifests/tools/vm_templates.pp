define mv_lxc::tools::vm_templates (
	$install_directory = $mv_lxc::params::lxc_tools_directory,
	$provisioning_server,
) {
		
	require('mv_lxc')
	require('mv_lxc::packages')

	# puppet
	file { "${install_directory}/fetch_lxc_vm_templates.sh": 
  	ensure 	=> file,
    mode		=> "0700",
    owner 	=> 'root',
    group 	=> 'root',
		content => template("mv_lxc/fetch_lxc_vm_templates.sh.erb"),
		require => File["$install_directory"],
	}

}