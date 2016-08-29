class archlinux::macbook (

  $bluetooth = false,
  $webcam = false,

) {

  if ! $::apple_hardware {
    fail("hardware is not supported")
  }

  include ::archlinux::macbook::audio
  include ::archlinux::macbook::backlight
  include ::archlinux::macbook::cardreader
  include ::archlinux::macbook::sensors
  include ::archlinux::macbook::i915
  include ::archlinux::macbook::keyboard
  include ::archlinux::macbook::touchpad
  include ::archlinux::macbook::wireless

  class { '::archlinux::macbook::bluetooth':
    bluetooth => $bluetooth,
  }

  class { '::archlinux::macbook::webcam':
    webcam => $webcam,
  }
}
