#!/bin/bash

cut -d: -f '1 3' /etc/passwd | tr -s ':' ' ' | sort -n -k 2

