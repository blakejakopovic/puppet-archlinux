class archlinux::parallels {

  if $::virtual != 'parallels' {
    fail('They system does not appear to be running in Parallels Desktop')
  }

  include ::archlinux::parallels::ethernet
  include ::archlinux::parallels::video
}
