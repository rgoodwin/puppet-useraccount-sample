#
# users that are applied to production services hosts
#
class users::groups::prod_services inherits users::virtual::all {

  file { "/etc/sudoers.d/services":
    ensure  => file,
    mode    => 0440,
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/users/prod_services-sudoers.conf",
  }

  User["svcs_backup"] {
    ensure  => present,
  }
  User <| tag  == 'svcs_backup' |> -> Ssh_authorized_key <| user == 'svcs_backup' |>

  User["john"] {
    ensure  => absent,
  }

  User["mark"] {
    ensure  => absent,
  }

  User["carl"] {
    ensure  => present,
    shell   => "/bin/false",
  }
  User <| tag  == 'carl' |> -> Ssh_authorized_key <| user == 'carl' |>


}
