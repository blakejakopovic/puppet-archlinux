class archlinux::macbook::wireless {

  # https://wiki.archlinux.org/index.php/MacBookPro11,x#Wireless
  package { 'broadcom-wl':
    ensure => present,
  }
}
