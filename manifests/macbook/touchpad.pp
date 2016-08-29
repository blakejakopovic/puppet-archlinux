class archlinux::macbook::touchpad {

  # Commented out as requires AUR
  # https://wiki.archlinux.org/index.php/MacBookPro11,x#input-mtrack
  # package { 'xf86-input-mtrack-git':
  #   ensure => installed,
  # }

  # file { '/etc/X11/xorg.conf.d/00-touchpad.conf':
  #   ensure  => file,
  #   source  => 'puppet:///modules/archlinux/macbook/00-touchpad.conf',
  #   owner   => 'root',
  #   group   => 'root',
  #   require => Package['xf86-input-mtrack-git'],
  # }
}
