class archlinux::keyboard {

  # https://wiki.archlinux.org/index.php/Keyboard_configuration_in_console#Adjusting_typematic_delay_and_rate
  # Note: the typematic delay in the virtual console is different from the typematic delay in Xorg
  file { 'kbdrate-service-file':
    ensure => file,
    name   => '/etc/systemd/system/kbdrate.service',
    source => 'puppet:///modules/archlinux/kbdrate.service',
    owner  => 'root',
    group  => 'root',
  }

  service { 'kbdrate':
    ensure  => running,
    enable  => true,
    require => File['kbdrate-service-file'],
  }
}
