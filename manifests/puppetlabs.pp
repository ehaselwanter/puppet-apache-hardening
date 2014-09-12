# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: apache_hardening::puppetlabs
#
# Overlay provider for puppetlabs/apache
#
# === Parameters
#
# none
#
class apache_hardening::puppetlabs(
  $allowed_http_methods = [
    'GET',
    'POST',
  ]
) {

  # make sure our options are written to the config file
  class{'apache_hardening::puppetlabs_override': }

  # additional configuration

  # addhardening parameters

  $conf_dir = $apache::confd_dir

  file { "${conf_dir}/90.hardening.conf":
    ensure  => file,
    content => template('apache_hardening/hardening.conf.erb'),
  }
}