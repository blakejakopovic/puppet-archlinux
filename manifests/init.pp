class archlinux (

  $default_user,
  $hostname,
  $timezone,

  $auto_login = true,
  $bluetooth = false,
  $default_shell = '/usr/bin/zsh',
  $webcam = false,

){

  if $::osfamily != 'Archlinux' {
    fail("${::operatingsystem} is not a supported operating system")
  }

  if $::apple_hardware {
    class { '::archlinux::macbook':
      bluetooth => $bluetooth,
      webcam    => $webcam,
    }
  }

  if $::virtual == 'parallels' {
    include ::archlinux::parallels
  }

  if $::virtual == 'virtualbox' {
    include ::archlinux::virtualbox
  }

  include ::archlinux::console
  include ::archlinux::dhcp
  include ::archlinux::harddrive
  include ::archlinux::keyboard
  include ::archlinux::ethernet
  include ::archlinux::networking
  include ::archlinux::power_saving
  include ::archlinux::ssh
  include ::archlinux::suspend
  include ::archlinux::swap
  include ::archlinux::wireless

  class { '::archlinux::hostname':
    hostname => $hostname,
  }

  class { '::archlinux::localusers':
    auto_login    => $auto_login,
    default_user  => $default_user,
    default_shell => $default_shell,
  }

  class { '::archlinux::system':
    hostname => $hostname,
  }
}
