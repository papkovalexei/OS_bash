#!/bin/bash

(mkdir ~/labs/OS/lab3/test 2> /dev/null) && (echo catalog test was created successfully > ~/report.log) && touch 'test/'"$(date +"%d.%m.%Y_%H:%M:%S_Launch_Script")"

(ping -w 1 "www.net_nikogo.ru" 2> /dev/null) || echo $(date +"%d.%m.%Y_%H:%M:%S") site does not work >> ~/report.log

