class archlinux::macbook::webcam (

  $webcam,

) {

  if (!$webcam) {
    # https://wiki.archlinux.org/index.php/Power_management#Web_camera
    file { '/etc/modprobe.d/51-webcam.conf':
      ensure => file,
      source => 'puppet:///modules/archlinux/macbook/51-webcam.conf',
      owner  => 'root',
      group  => 'root',
    }
  }
}
