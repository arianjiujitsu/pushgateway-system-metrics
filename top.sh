#!/bin/bash
z=$(ps aux)
while true; do
   while read -r z
   do
   #var=$var$(awk '{print "cpu_usage{process=\""$11"\", pid=\""$2"\"}", $3z}');
    var=$(ps aux | awk 'NR>1 {print "cpu_usage{process=\""$11"\", pid=\""$2"\"}", $3z}');
   done <<< "$z"
   curl -X POST -H  "Content-Type: text/plain" --data "$var
   " http://localhost:9091/metrics/job/top/instance/machine
   sleep 3 
done
