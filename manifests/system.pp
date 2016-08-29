class archlinux::system (

  $hostname,

) {

  Package {
    ensure => installed,
  }

  package { 'git': }
  package { 'zsh': }
  
  # https://wiki.archlinux.org/index.php/Silent_boot
  file { '/etc/sysctl.d/20-quiet-printk.conf':
    ensure => file,
    source => 'puppet:///modules/archlinux/20-quiet-printk.conf',
    owner  => 'root',
    group  => 'root',
  }

  # https://wiki.archlinux.org/index.php/Makepkg#MAKEFLAGS
  file { '/etc/makepkg.conf':
    ensure => file,
    source => 'puppet:///modules/archlinux/makepkg.conf',
    owner  => 'root',
    group  => 'root',
  }

  # Setup system git config (for etckeeper)
  file { '/etc/gitconfig':
    ensure  => file,
    content => template('archlinux/gitconfig.erb'),
    owner   => 'root',
    group   => 'root',
  }

  # https://wiki.archlinux.org/index.php/Etckeeper
  package { 'etckeeper':
    ensure  => installed,
    require => [Package['git'], File['/etc/gitconfig']],
    notify  => Exec['etckeeper-init-exec'],
  }

  # !! setup git author before init/commit
  exec { 'etckeeper-init-exec':
    command     => 'etckeeper init',
    path        => '/usr/bin',
    refreshonly => true,
  }

  # https://wiki.archlinux.org/index.php/Core_utilities#locate
  # Automatically scheduled to run daily via systemd
  package {'mlocate':
    ensure => present,
    notify => Exec['updatedb'],
  }

  exec {'updatedb':
    refreshonly => true,
    command     => '/usr/bin/updatedb',
    subscribe   => Package['mlocate'],
  }
}
