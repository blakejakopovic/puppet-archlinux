class archlinux::macbook::cardreader {

  # https://wiki.archlinux.org/index.php/MacBookPro11,x#Powersave
  file { '/etc/udev/rules.d/99-apple_cardreader.rules':
    ensure => file,
    source => 'puppet:///modules/archlinux/macbook/99-apple_cardreader.rules',
    owner  => 'root',
    group  => 'root',
  }
}
