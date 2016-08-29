class archlinux::wireless {

  Package {
    ensure => present,
  }

  # https://wiki.archlinux.org/index.php/netctl
  package { 'dialog': }
  package { 'wpa_supplicant': }

  # https://wiki.archlinux.org/index.php/netctl#Automatic_switching_of_profiles
  package { 'wpa_actiond': }

  # https://wiki.archlinux.org/index.php/Wireless_network_configuration#Rfkill_caveat
  package { 'rfkill': }

  # https://wiki.archlinux.org/index.php/Wireless_network_configuration#Respecting_the_regulatory_domain
  package { 'crda': }

  # https://wiki.archlinux.org/index.php/Wireless_network_configuration#Wireless_management
  package { 'iw': }
  package { 'wireless_tools': }

  # https://wiki.archlinux.org/index.php/Power_management#Network_interfaces
  file { '/etc/udev/rules.d/70-wifi-powersave.rules':
    ensure  => file,
    source  => 'puppet:///modules/archlinux/70-wifi-powersave.rules',
    owner   => 'root',
    group   => 'root',
    require => Package['iw'],
  }
}
