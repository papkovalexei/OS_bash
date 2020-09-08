#!/bin/bash

grep -U -h -r -E -o "[[:alnum:]]+@[[:alnum:]]+.[[:alnum:]]+" /etc/ | tr -s '\n' ',' > emails.lst

echo '\n' >> emails.lst
