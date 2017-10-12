# Configure joomla

class joomla::configure {
  $zip_destination = '/tmp/temp.zip'
  $unzip_destination = '/var/www/html/joomla'  

  package {'unzip':
    ensure => present,
  }

  exec {'unzip-${zip_destination}':
    command => ['unzip ${zip_destination} -d ${unzip_destination} && chown -R apache.apache ${unzip_destination}'],
    path    => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/'],
    require => Package['unzip']
  }
}

