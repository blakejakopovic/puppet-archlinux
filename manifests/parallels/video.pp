class archlinux::parallels::video {

  package { 'xf86-video-vesa':
    ensure => installed,
  }
}
