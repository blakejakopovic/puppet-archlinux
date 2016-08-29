class archlinux::localusers (

  $default_user,
  $default_shell,
  $auto_login = false,

) {

  user { 'root':
    ensure  => 'present',
    comment => 'root [puppet managed]',
    uid     => '0',
    gid     => '0',
    home    => '/root',
    shell   => '/bin/bash',
    system  => true,
  }

  user { 'default_user':
    ensure     => 'present',
    comment    => "${default_user} [puppet managed]",
    name       => $default_user,
    shell      => $default_shell,
    groups     => ['input','wheel'],
    managehome => true,
    require    => Package['zsh'],
  }

  # https://wiki.archlinux.org/index.php/automatic_login_to_virtual_console
  if ($auto_login) {
    file { 'getty-service-directory':
      ensure => directory,
      name   => '/etc/systemd/system/getty@tty1.service.d/',
      owner  => 'root',
      group  => 'root',
    }

    file { '/etc/systemd/system/getty@tty1.service.d/override.conf':
      ensure  => file,
      content => template('archlinux/getty.conf.erb'),
      owner   => 'root',
      group   => 'root',
      require => [File['getty-service-directory'], User['default_user']],
    }
  }
}
