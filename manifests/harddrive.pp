class archlinux::harddrive {

  # https://wiki.archlinux.org/index.php/maximizing_performance#Using_udev_for_one_device_or_HDD.2FSSD_mixed_environment
  file { '/etc/udev/rules.d/60-schedulers.rules':
    ensure => present,
    source => 'puppet:///modules/archlinux/60-schedulers.rules',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
