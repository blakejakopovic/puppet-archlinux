class archlinux::console {

  # https://wiki.archlinux.org/index.php/Keyboard_configuration_in_console
  file { '/etc/vconsole.conf':
    ensure => file,
    source => 'puppet:///modules/archlinux/vconsole.conf',
  }
}
