class archlinux::networking {

  # Load interfaces list from facter
  $interfaces = $::interfaces

  Package {
    ensure => installed,
  }

  # https://wiki.archlinux.org/index.php/Avahi
  package { 'avahi': }
  package { 'inetutils': }

  package { 'nss-mdns':
    require => Package['avahi'],
  }

  file { '/etc/nsswitch.conf':
    ensure  => file,
    source  => 'puppet:///modules/archlinux/nsswitch.conf',
    require => Package['nss-mdns'],
  }

  # https://wiki.archlinux.org/index.php/IPv6#Privacy_extensions
  file { '/etc/sysctl.d/40-ipv6.conf':
    ensure  => file,
    content => template('archlinux/40-ipv6.conf.erb'),
    owner   => 'root',
    group   => 'root',
  }
}
