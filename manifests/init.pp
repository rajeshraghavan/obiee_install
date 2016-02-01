# == Class: obi_install
# Full description of class obi_install here.
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
# Date:   May 22, 2015
#
# === Copyright
#
# This module takes 5 input parameters like BU_Name, Env_Name, Version_No, User_name and Group_name
#

class obi_install ($bu_name = "crp", $env_name = "dev", $ver_no = "11_1_1_7", $userid = "oraclebi", $group_name="oraclebi") 
{
 if $::osfamily == 'RedHat' 
 {
  contain obi_install::orainst
  contain obi_install::alter_file
  contain obi_install::build_mw_home
  contain obi_install::install_pkgs
  contain obi_install::obiee_install
  include obi_install::orainst
  include obi_install::alter_file
  include obi_install::build_mw_home
  include obi_install::install_pkgs
  include obi_install::obiee_install
  
  Class['obi_install::orainst'] -> Class['obi_install::alter_file'] -> Class['obi_install::build_mw_home'] -> Class['obi_install::install_pkgs'] -> Class['obi_install::obiee_install']
}
}   

