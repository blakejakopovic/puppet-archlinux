class archlinux::macbook::audio {

  # https://wiki.archlinux.org/index.php/Power_management#Audio
  file { '/etc/modprobe.d/60-snd_hda_intel.conf':
    ensure => file,
    source => 'puppet:///modules/archlinux/macbook/60-snd_hda_intel.conf',
    owner  => 'root',
    group  => 'root',
  }

  # https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture
  package { 'alsa-utils':
    ensure => installed,
  }
}
