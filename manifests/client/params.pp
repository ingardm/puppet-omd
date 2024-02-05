# (private) defaults for omd::client
class omd::client::params {

  Boolean $download_package = true
  String $download_source  = 'http://mathias-kettner.de/download'
  Boolean $logwatch_install = false
  String $xinetd_disable   = 'no'
  String $check_only_from  = undef
  String $check_agent      = '/usr/bin/check_mk_agent'
  $hosts            = { 'default' => {} }
  $hosts_defaults   = {}

  String $user             = 'root'
  String $group            = 'root'

  case $::osfamily {
    'Debian': {
      $package_name = 'check-mk-agent'
    }
    'RedHat': {
      $package_name = 'check_mk-agent'
    }
    default: {
      fail("${::osfamily} not supported")
    }
  }

}
