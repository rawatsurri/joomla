# Class: joomla
# ===========================
#
# Full description of class joomla here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'joomla':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class joomla {
$mysql_password = Secret4db

include joomla::php
include joomla::apache
include joomla::mysql
include joomla::db
include joomla::download
include joomla::configure

Class['joomla::php'] -> Class['joomla::apache'] -> Class['joomla::mysql'] -> Class['joomla::db'] -> Class['joomla::download'] -> Class['joomla::configure']

}

