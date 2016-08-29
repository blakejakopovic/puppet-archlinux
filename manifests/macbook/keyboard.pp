class archlinux::macbook::keyboard {

  # https://wiki.archlinux.org/index.php/MacBook#Keyboard_Backlight
  package { 'kbdlight':
    ensure => installed,
  }
}
