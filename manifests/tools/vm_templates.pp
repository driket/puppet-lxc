define mv_lxc::tools::vm_templates (
	$install_directory = $mv_lxc::params::lxc_tools_directory,
	$provisioning_server_fqdn,
	$provisioning_server_ip,
) {
		
	require('mv_lxc')
	require('mv_lxc::packages')

	# puppet
	file { "${install_directory}/template-tools.sh": 
  	ensure 	=> file,
    mode		=> "0700",
    owner 	=> 'root',
    group 	=> 'root',
		content => template("mv_lxc/template-tools.sh.erb"),
		require => File["$install_directory"],
	}
}