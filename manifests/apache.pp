class joomla::apache {
	package { 'httpd':
		ensure	=> present
	}
	
	file { '/etc/httpd/conf/httpd.conf':,
		ensure 	=> file,
		content	=> '<?php  phpinfo(); ?>',
		require	=> Package['httpd'],
	}

	file { '/etc/httpd/conf.d/vhost.conf':
		ensure	=> file,
		content	=> template('joomla/vhost.conf.erb'),
		require	=> Package['httpd'],
	}

	service { 'httpd':
		ensure		=> running,
		enable		=> true,
		hasrestart	=> true,
		require		=> [File['/etc/httpd/conf/httpd.conf], File['/etc/httpd/conf.d/vhost.conf']]
	}
}
