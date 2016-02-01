# == Class: obiee_install
# Full description of class obiee_install here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.

# [$bu_name = "crp", $env_name = "dev", $ver_no = "11.1.1.7", $userid = "oraclebi", $group_name="oraclebi"]
#

# === Authors

# Author: Raj Raghavan <rajeshr@qualcomm.com>
# Date:   May 04, 2015
#
# === Copyright
#
# This module leverages ERB template and takes the 5 input parameters like BU_Name, Env_Name, Version_No, User_name and Group_name
#

class obi_install::obiee_install inherits obi_install
{
 $Script_name = '/prj/obidev/installs/OBIEE11G/11.1.1.7/OBIEE_11.1.1.7_Linux_X86_64/silent_install.sh'
 $bu_name = $obi_install::bu_name
 $env_name = $obi_install::env_name
 $ver_no = $obi_install::ver_no
 $user_id = $obi_install::user_id
 $group_name = $obi_install::group_name
 
 if $::osfamily == 'RedHat' 
 {
  file { "/local/mnt/obiee/response.rsp":
    ensure => file ,
    mode => '0755',
    owner => "$userid",
    group => "$group_name",
    content => template("${module_name}/response.erb")
  } ->
   exec { 'Install_Oracle':
    #command => "/prj/obidev/installs/OBIEE11G/11.1.1.7/OBIEE_11.1.1.7_Linux_X86_64/V37449-01_1of2/bishiphome/Disk1/runInstaller -silent -response /local/mnt/obiee/response.rsp -invPtrLoc /etc/oraInst.loc",
     command => "sh -x ${Script_name}",
 #   command => "sh -x /local/mnt/workspace/test.sh",
    #cwd => "/prj/obidev/installs/OBIEE11G/11.1.1.7/OBIEE_11.1.1.7_Linux_X86_64/V37449-01_1of2/bishiphome/Disk1",
    path => $::path,
     creates => "/local/mnt/obiee/$bu_name/$env_name/$ver_no/instances/instance1/config/OracleBIPresentationServicesComponent/coreapplication_obips1/instanceconfig.xml",
     group => "$group_name",
     user => "$userid",
     logoutput => true,
     #path => ["/usr/bin", "/usr/sbin", "/bin"]
     }
     notify { 'Install_logs':
      message => "Check the latest log under /local/mnt/obiee/Oracle_Inventory/logs for the installation status.",
      }
#     include obiee_install
 }
}   

