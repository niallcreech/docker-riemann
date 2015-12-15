#!/bin/bash
set -e

echo Starting Reimann service...
service riemann start

attempts=30
delay=1

# Poll to until the riemann logs are available
for i in $(seq 1 $attempts); do
  # Follow the logs to allow the script to continue running
  if [ -f "/var/log/riemann/riemann.log" ]; then
    echo Reimann server started after $((${i}*${delay})) seconds, tailing log... 
    tail -f /var/log/riemann/riemann.log
  fi
  echo Reimann service not started yet, logs not available after ${i} of ${attempts} attempts, waiting ${delay} seconds...
  sleep 1
done
