class archlinux::virtualbox {

  if $::virtual != 'virtualbox' {
    fail('They system does not appear to be running in VirtualBox')
  }

  include ::archlinux::virtualbox::ethernet
  include ::archlinux::virtualbox::guest
  include ::archlinux::virtualbox::video
}
