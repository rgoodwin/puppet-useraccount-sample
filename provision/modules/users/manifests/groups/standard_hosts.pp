#
# users that are applied to all hosts
#
class users::groups::standard_hosts inherits users::virtual::all {

  file { "/etc/sudoers.d/standard_hosts.conf":
    ensure  => file,
    mode    => 0440,
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/users/standard_hosts-sudoers.conf",
  }

  User["svcs_backup"] {
    ensure  => present,
  }
  User <| tag  == 'svcs_backup' |> -> Ssh_authorized_key <| user == 'svcs_backup' |>

  User["john"] {
    ensure  => present,
  }
  User <| tag  == 'john' |> -> Ssh_authorized_key <| user == 'john' |>

  User["mark"] {
    ensure  => present,
  }
  User <| tag  == 'mark' |> -> Ssh_authorized_key <| user == 'mark' |>


  User["carl"] {
    ensure  => present,
  }
  User <| tag  == 'mark' |> -> Ssh_authorized_key <| user == 'mark' |>


}
