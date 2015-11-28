# splay cron
class cron_splay::base {
  require ::cron
  file{'/usr/local/sbin/cron-splay.sh':
    source => 'puppet:///modules/cron_splay/cron-splay.sh',
    notify => Exec[splay_cron],
    owner  => root,
    group  => 0,
    mode   => '0700';
  }

  $minutes = fqdn_rand(59)
  exec{
    'splay_hourly_cron':
      command => "sed -ri 's/^[0-9][0-9]{1,2} (.*cron\\.hourly)/${minutes} \\1/' /etc/crontab",
      unless  => "grep -Eq '^${minutes} .*cron\\.hourly' /etc/crontab",
  }

  exec{'splay_cron':
    command     => '/usr/local/sbin/cron-splay.sh',
    refreshonly => true,
  }
}
