# randomly splay the hourly cron
class cron_splay::base {
  $minutes = fqdn_rand(59)
  exec{
    'splay_hourly_cron':
      command => "sed -i 's/^[0-9][0-9] /${minutes} /' /etc/cron.d/0hourly",
      unless  => "grep -Eq '^${minutes} ' /etc/cron.d/0hourly",
  }
}
