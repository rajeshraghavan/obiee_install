class obi_install::orainst inherits obi_install
{
if $::osfamily == 'RedHat'
{
 $group_name = $obi_install::group_name

 file {"/etc/oraInst.loc":
     ensure => file,
     owner => 'root',
     mode => '0744',
     content => "inventory_loc=/local/mnt/obiee/Oracle_Inventory\ninst_group=${group_name}",

}
}
}
#include orainst
