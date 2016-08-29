class archlinux::macbook::bluetooth (

  $bluetooth,

) {

  if (!$bluetooth) {
    file { '/etc/modprobe.d/50-bluetooth.conf':
      ensure => file,
      source => 'puppet:///modules/archlinux/macbook/50-bluetooth.conf',
      owner  => 'root',
      group  => 'root',
    }

    # https://wiki.archlinux.org/index.php/MacBookPro11,x#Powersave
    file { '/etc/udev/rules.d/99-apple_broadcom_bcm2046_bluetooth.rules':
      ensure => file,
      source => 'puppet:///modules/archlinux/macbook/98-apple_broadcom_bcm2046_bluetooth.rules',
      owner  => 'root',
      group  => 'root',
    }
  }
}
