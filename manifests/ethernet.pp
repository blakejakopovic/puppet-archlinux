class archlinux::ethernet {

  Package {
    ensure => installed,
  }

  package { 'ethtool': }
  package { 'ifplugd': }

  # https://wiki.archlinux.org/index.php/Power_management#Network_interfaces
  file { '/etc/udev/rules.d/70-disable_wol.rules':
    ensure  => file,
    source  => 'puppet:///modules/archlinux/70-disable_wol.rules',
    owner   => 'root',
    group   => 'root',
    require => Package['ethtool'],
  }
}
