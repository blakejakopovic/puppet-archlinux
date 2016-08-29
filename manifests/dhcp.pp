class archlinux::dhcp {

  package { 'dhcpcd':
    ensure => installed,
  }
}
