class archlinux::virtualbox::guest {

  # https://wiki.archlinux.org/index.php/VirtualBox#Install_the_Guest_Additions
  package { 'virtualbox-guest-modules-arch':
    ensure  => installed,
  }

  # virtualbox-guest-modules-arch versions 5.0.16 and below only
  # service { 'vboxservice':
  #   ensure  => running,
  #   enable  => true,
  #   require => Package['virtualbox-guest-modules-arch'],
  # }
}
