# Download joomla package

class joomla::download {
  $zip_destination = '/tmp/temp.zip'
  $unzip_destination = '/var/www/html/joomla'
  $content = 'https://github.com/rawatsurri/joomla_content/blob/master/package/joomla_3-8-1-stable-full_package-zip%3Fformat%3Dzip'

  package { 'wget':
    ensure	=> present,
  }

  file { '${zip_destination}':
    ensure	=> directory,
    owner	=> apache,
    recurse => true,
    owner => 'apache',
    group => 'apache',
    onlyif	=> ['test ! -d ${zip_destination}'],
  }

  exec { 'wget-${content}':
   command	=> 'wget ${content} --no-check-certificate -O ${zip_destination}',
    path    => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/'],
    require	=> Package['wget'],
    onlyif	=> ['test ! -f ${zip_destination}'],
  }
}
