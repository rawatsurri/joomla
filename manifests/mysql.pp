# Install mysql db

class joomla::mysql {
  package { 'mysql-server':
    ensure => installed,
  }

  service { 'mysqld':
    ensure  => running,
    enable  => true,
    require => Package['mysql-server'],
  }

  file { '/var/lib/mysql/my.cnf':
    owner   => 'mysql',
    group   => 'mysql',
    source  => 'puppet:///modules/joomla/my.cnf',
    notify  => Service['mysqld'],
    require => Package['mysql-server'],
  }

  exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -p$mysql_password status',
    path    => ['/bin', '/usr/bin'],
    command => 'mysqladmin -uroot password $mysql_password',
    require => Service['mysqld'],
  }
}
