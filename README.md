# Puppet Arch Linux

Automated setup and configuration module for Arch Linux systems. Provides additional support for *Retina Macbook Pro (11,3)*, *Parallels Desktop*, and *VirtualBox* environments.

This module was designed to support standalone puppet compilations, where no Puppet master is required. However, there is no reason why it can't also be used by a Puppet master to keep systems in check.

## NOTICE
This is an early release. It's **not yet production ready**.

### Setup Requirements

A basic Arch Linux install with the following packages

* base
* base-devel
* git
* puppet

Note: An internet connection (or package cache) is required

## Usage

When using a Puppet server

```
sudo puppet module install blakejakopovic-archlinux

node 'mybox.home.net' {
  class { '::archlinux':
    default_user  => 'blake',
    hostname      => 'bach',
    timezone      => 'Australia/Brisbane',
  }
}
```

When using in standalone mode (without Puppet master)

```
sudo puppet module install blakejakopovic-archlinux
sudo puppet apply -e "class { 'archlinux': default_user => 'blake', hostname => 'bach', timezone => 'Australia/Brisbane' }"
```

Note: For existing systems, it's advisable to use the `--noop --verbose` flags, so you can review any changes that may occur.

## Development

If you find anything wrong, feel free to leave a github issue or submit a pull request.

## License
Copyright (c) 2016 Blake Jakopovic. Licensed under the Apache-2.0 license.
