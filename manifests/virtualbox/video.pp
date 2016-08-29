class archlinux::virtualbox::video {

  package { 'xf86-video-vesa':
    ensure => installed,
  }
}
