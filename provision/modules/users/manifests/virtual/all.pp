#
#
# == Class: users::virtual::all
#
# Holds all users as virtual resources
#
class users::virtual::all {

  # xross OS support for ruby-shadow
  case $osfamily {
      # $ruby_shadow_package_name = 
      'Ubuntu', 'Debian': {
        package {'ruby-shadow':
           ensure => installed,
            name => 'libshadow-ruby1.8',
        }
      }
      'CentOS', 'RedHat', 'RedHatEnterpriseServer': {
          package {'ruby-shadow':
            ensure => installed,
            name => 'ruby-shadow',
          }
      }
  }


  # for host backups
  @user { "svcs_backup":
    ensure  => present,
    uid => '2001',
    comment => "Mange hosts backups",
    managehome    => "true",
    shell   => "/bin/bash",
    password => '$1$QROhBXIy$MM9hO2Zqchz14w25dZkF91',
    require => Package['ruby-shadow'],
  }
  @ssh_authorized_key {'svcs_shell_key_one':
    ensure  => present,
    user    => svcs_backup,
    type    => "ssh-rsa",
    key     => "2c786c96-f5dc-11e3-b3ed-14109fe4b85b",
  }
  @ssh_authorized_key {'svcs_shell_key_two':
    ensure  => present,
    user    => svcs_backup,
    type    => "ssh-rsa",
    key     => "4c256ef4-f5dc-11e3-ae5d-14109fe4b85b",
  }
  @ssh_authorized_key {'svcs_shell_key_three':
    ensure  => present,
    user    => svcs_backup,
    type    => "ssh-rsa",
    key     => "251a14bdc-f5dc-11e3-b438-14109fe4b85b",
  }

  # user accounts - sorted by username
  #

  @user { "carl":
    ensure  => present,
    uid => '3003',
    comment => "Carl",
    managehome    => "true",
    shell   => "/bin/bash",
    password => '$1$QROhBXIy$MM9hO2Zqchz14w25dZkF91',
    require => Package['ruby-shadow'],
  }
  @ssh_authorized_key {'carl-key':
    ensure  => present,
    user    => carl,
    type    => "ssh-rsa",
    key     => "1332d122-f5dc-11e3-a2f6-14109fe4b85b"
  }

  @user { "john":
    ensure  => present,
    uid => '3001',
    comment => "Jon",
    managehome    => "true",
    shell   => "/bin/bash",
    password => '$1$QROhBXIy$MM9hO2Zqchz14w25dZkF91',
    require => Package['ruby-shadow'],
  }
  @ssh_authorized_key {'john-key':
    ensure  => present,
    user    => john,
    type    => "ssh-rsa",
    key     => "30ef0550-f5dc-11e3-a3f2-14109fe4b85b"
  }

  @user { "mark":
    ensure  => present,
    uid => '3002',
    comment => "Mark",
    managehome    => "true",
    shell   => "/bin/bash",
    password => '$1$QROhBXIy$MM9hO2Zqchz14w25dZkF91',
    require => Package['ruby-shadow'],
  }
  @ssh_authorized_key {'mark-key':
    ensure  => present,
    user    => mark,
    type    => "ssh-rsa",
    key     => "3c72e9c8-f5dc-11e3-a5d9-14109fe4b85b"
  }


}
