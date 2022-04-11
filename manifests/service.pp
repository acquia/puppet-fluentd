# Configure service
#
class fluentd::service inherits fluentd {
  file {
    '/opt/td-agent':
      owner   => $::fluentd::user_name,
      group   => $::fluentd::user_group,
      mode    => '0755',
      recurse =>  true,
  }
  if $::fluentd::service_manage {
    service { 'fluentd':
      ensure     => $::fluentd::service_ensure,
      name       => $::fluentd::service_name,
      enable     => $::fluentd::service_enable,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
