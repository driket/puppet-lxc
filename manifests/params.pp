# configuer le produit ici
class mv_lxc::params {

  # service(s) name
  $service_name = 'lxc'

  # where lxc tools are installed (create machine, backup, skels, etc.)
  $lxc_tools_directory = '/opt/lxc-tools'

  # where lxc containers are located
  $lxc_containers_directory = '/var/lib/lxc'

}
