#!/bin/sh
#MySQL Qcache_hit_rate

Qcache_hits=`/usr/bin/mysqladmin -u root --password= extended-status | grep 'Qcache_hits'|awk '{print $4;}'`
Qcache_inserts=`/usr/bin/mysqladmin -u root --password= extended-status | grep 'Qcache_inserts'|awk '{print $4;}'`
Qcache_not_cached=`/usr/bin/mysqladmin -u root --password= extended-status | grep 'Qcache_not_cached'|awk '{print $4;}'`

Qcache_num_1=`expr $Qcache_hits + $Qcache_inserts + $Qcache_not_cached`
Qcache_hit_rate=`echo "scale=4; ($Qcache_hits / $Qcache_num_1) * 100" | bc`
echo $Qcache_hit_rate|cut -c-5
