class obi_install::build_mw_home inherits obi_install
{

#$bu_name = "from obi_install::build_mw_home"
#$env_name = "from obi_install::build_mw_home"
#$version_number = "from obi_install::build_mw_home"
#$user_id = "from obi_install::build_mw_home"
#$group_name = "from obi_install::build_mw_home"

$bu_name = $obi_install::bu_name
$env_name = $obi_install::env_name
$ver_no = $obi_install::ver_no
$user_id = $obi_install::user_id
$group_name = $obi_install::group_name


$mw_dirs = ["/local/mnt/obiee/", "/local/mnt/obiee/${bu_name}/", "/local/mnt/obiee/${bu_name}/${env_name}/", "/local/mnt/obiee/${bu_name}/${env_name}/${ver_no}", ]

  file {$mw_dirs:
    ensure  => directory,
    mode    => '700',
    owner   =>  "${userid}",
    group   =>  "${group_name}",
#  content => "this is sample text",
        }
 }
