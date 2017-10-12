# Create joola db user and set password

class joomla::db {
  $db_user = 'admin'
  $dbuser_pass = 'password'
  $db_name = 'joomla'

  exec { "create-${db_name}-db":
    unless => "/usr/bin/mysql -u${db_user} -p${db_password} ${db_name}",
    command => "/usr/bin/mysql -uroot -p$mysql_password -e \"create database ${db_name}; grant all on ${db_name}.* to ${db_user}@localhost identified by '$db_password';\"",
  }
}
