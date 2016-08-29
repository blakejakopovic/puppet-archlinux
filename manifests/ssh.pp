class archlinux::ssh {

  # https://wiki.archlinux.org/index.php/Secure_Shell
  package { 'openssh':
    ensure => installed,
  }

  file { '/etc/ssh/ssh_config':
    ensure => file,
    source => 'puppet:///modules/archlinux/ssh_config',
    owner  => 'root',
    group  => 'root',
  }
}
