#
# Regular cron jobs for the plexurl package
#
0 4	* * *	root	[ -x /usr/bin/plexurl_maintenance ] && /usr/bin/plexurl_maintenance
