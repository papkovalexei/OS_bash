#!/bin/bash

find /var/log -type f -iname '*.log' -exec wc -l {} + | grep total | awk '{print $1}'
