class archlinux::hostname (

  $hostname,

) {

  # https://wiki.archlinux.org/index.php/Network_configuration#Set_the_hostname
  # hostnamectl set-hostname myhostname
  file { '/etc/hostname':
    ensure  => file,
    content => $hostname,
    owner   => 'root',
    group   => 'root',
  }

  file { '/etc/hosts':
    ensure  => file,
    content => template('archlinux/hosts.erb'),
    owner   => 'root',
    group   => 'root',
  }
}
