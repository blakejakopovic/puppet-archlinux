class archlinux::swap {

  # https://wiki.archlinux.org/index.php/Swap#Performance_Tuning
  file { '/etc/sysctl.d/99-swap.conf':
    ensure => file,
    source => 'puppet:///modules/archlinux/99-swap.conf',
    owner  => 'root',
    group  => 'root',
  }
}
