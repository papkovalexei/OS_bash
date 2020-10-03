#!/bin/bash

(grep -h -r -E -o "[[:alnum:]]+@[[:alnum:]]+.[[:alnum:]]+" /etc/ | tr -s '\n' ',' > emails.lst) 2> /dev/null

echo '\n' >> emails.lst
