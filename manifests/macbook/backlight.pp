class archlinux::macbook::backlight {

  # https://wiki.archlinux.org/index.php/MacBookPro11,x#Screen_backlight
  package { 'gmux_backlight':
    ensure => present,
  }
}
