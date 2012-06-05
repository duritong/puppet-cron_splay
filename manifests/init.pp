#
# cron_splay module
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
# of regular splay of cron for all hosts
# for centos. it deploys as well some
# splay scripts for the specific cron-
# directories, as they are missing on
# centos systems.
#

class cron_splay {
  case $::operatingsystem {
    centos: { include cron_splay::base }
    default: { info("No cron splaying supported so far on ${::operatingsystem}") }
  }
}
