class archlinux::macbook::i915 {

  # https://wiki.archlinux.org/index.php/Intel_graphics#Module-based_Powersaving_Options
  file { '/etc/modprobe.d/60-i915.conf':
    ensure => file,
    source => 'puppet:///modules/archlinux/macbook/60-i915.conf',
    owner  => 'root',
    group  => 'root',
  }
}
