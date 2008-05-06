#######################################
# cron-delay module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
#
# This module is used to manage a kind
# of refular delay for all hosts
# for centos it deploys as well some
# delay scripts for the specific cron-
# directories, as they are missing on
# centos systems.
#######################################


# modules_dir { "cron-delay": }
class cron-delay {
    include cron-delay::base
}

class cron-delay::base {
   file{"/opt/bin/cron-schedule.sh":
        source => "puppet://$server/cron-delay/cron-schedule.sh",
        require => File["/opt/bin"],
        notify => Exec[delay_crons],
        mode => 0700, owner => root, group => 0;
    }

    exec{delay_crons:
        command => "/opt/bin/cron-schedule.sh",
        refreshonly => true,
        require => File["/opt/bin/cron-schedule.sh"],
    }
}
