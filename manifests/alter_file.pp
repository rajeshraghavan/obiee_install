class obi_install::alter_file inherits obi_install 
{

$user_id = $obi_install::user_id

if $::osfamily == 'RedHat'
{

file_line { 'End of File':
  path  => '/etc/security/limits.conf',
  line  => "$userid soft nofile  4096",
          }

  file_line { '$userid soft nofile  4096':
  path  => '/etc/security/limits.conf',
  line  => "$userid hard nofile  65536",
}
}
}
include stdlib
