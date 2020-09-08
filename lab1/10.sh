#!/bin/bash

man bash | tr -s '[[:space:]]' '\n' | sort | uniq -c | sort -r -n -k 1 | head -3
