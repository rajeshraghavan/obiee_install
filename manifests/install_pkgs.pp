class obi_install::install_pkgs inherits obi_install
{

 if $::osfamily == 'RedHat' 
{
 $pkgs_list = hiera('packages')

  package { $pkgs_list:
     ensure => installed,
        }
}
}
