class cron_splay::base {
  require cron
  file{"/usr/local/sbin/cron-splay.sh":
    source => "puppet:///modules/cron_splay/cron-splay.sh",
    notify => Exec[splay_cron],
    mode => 0700, owner => root, group => 0;
  }

  exec{splay_cron:
    command => "/usr/local/sbin/cron-splay.sh",
    refreshonly => true,
  }
}
