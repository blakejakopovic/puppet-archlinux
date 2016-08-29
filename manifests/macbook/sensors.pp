class archlinux::macbook::sensors {

  file { '/etc/modules':
    ensure => present,
    source => 'puppet:///modules/archlinux/macbook/modules',
    owner  => 'root',
    group  => 'root',
  }

  # https://wiki.archlinux.org/index.php/Lm_sensors
  package { 'lm_sensors':
    ensure => present,
  }
}
