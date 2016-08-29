class archlinux::parallels::ethernet {

  $ethernet_first = $::ethernet_first

  # https://wiki.archlinux.org/index.php/netctl
  file { 'netctl-ethernet-file':
    ensure  => file,
    name    => "/etc/netctl/${ethernet_first}",
    content => template('archlinux/ethernet-dhcp.erb'),
    owner   => 'root',
    group   => 'root',
    notify  => Service['netctl-ethernet-service'],
  }

  service { 'netctl-ethernet-service':
    ensure  => running,
    name    => "netctl-ifplugd@${ethernet_first}",
    enable  => true,
    require => [Package['ifplugd'], File['netctl-ethernet-file']],
  }
}
