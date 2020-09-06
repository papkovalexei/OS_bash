#!/bin/bash

awk '$2 = "INFO"' //var/log/syslog > info.log  
