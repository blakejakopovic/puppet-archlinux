class archlinux::suspend {

  # https://wiki.archlinux.org/index.php/Power_management#Power_management_with_systemd
  file { '/etc/systemd/logind.conf':
    ensure => file,
    source => 'puppet:///modules/archlinux/logind.conf',
    owner  => 'root',
    group  => 'root',
  }
}
