#
# cron-delay module
#
# Copyright 2008, admin(at)immerda.ch
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#
# This module is used to manage a kind
# of refular delay for all hosts
# for centos it deploys as well some
# delay scripts for the specific cron-
# directories, as they are missing on
# centos systems.
#

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
