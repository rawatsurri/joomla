# Install php

class joomla::php {
  $php_pkg = [
    'php',
    'php-mysql',
    'php-cli',
    'php-odbc',
    'php-pear'
  ]

  package { $php_pkg:
    ensure => present,
    before => File['/etc/php.ini'],
  }

  file { '/etc/php.ini':
    ensure  => file,
    require => Package['php']
  }
}
