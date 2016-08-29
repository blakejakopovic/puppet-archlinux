class archlinux::power_saving {

  Package {
    ensure  => present,
  }

  File {
    ensure  => file,
    owner   => 'root',
    group   => 'root',
  }

  Service {
    ensure  => running,
    enable  => true,
  }

  package { 'cpupower': }

  service { 'cpupower':
    require => Package['cpupower'],
  }

  # https://wiki.archlinux.org/index.php/Power_management#Disabling_NMI_watchdog
  file { '/etc/sysctl.d/40-disable_watchdog.conf':
    source => 'puppet:///modules/archlinux/30-disable_watchdog.conf',
  }

  # https://wiki.archlinux.org/index.php/Power_management#Laptop_Mode
  file { '/etc/sysctl.d/75-laptop.conf':
    source => 'puppet:///modules/archlinux/75-laptop.conf',
  }

  # https://wiki.archlinux.org/index.php/Power_management#USB_autosuspend
  file { '/etc/udev/rules.d/50-usb_power_save.rules':
    source => 'puppet:///modules/archlinux/50-usb_power_save.rules',
  }
}
