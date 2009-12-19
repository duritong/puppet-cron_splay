class cron-splay::base {
   file{"/usr/local/sbin/cron-splay.sh":
        source => "puppet://$server/modules/cron-splay/cron-splay.sh",
        notify => Exec[splay_cron],
        mode => 0700, owner => root, group => 0;
    }

    exec{splay_cron:
        command => "/usr/local/sbin/cron-splay.sh",
        refreshonly => true,
    }
}
