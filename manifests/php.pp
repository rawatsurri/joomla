joomla::php {
	$packages = ['php','php-mysql','php-cli,'php-odbc','php-pear']
	
	package { $packages:
		ensure	=> present,
		before	=> File['/etc/php.ini'],
	}

	file {'/etc/php.ini':
		ensure	=> file,
		require	=> Package['php']
	}

