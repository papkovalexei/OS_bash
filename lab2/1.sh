#!/bin/bash

ps -aux | awk '$1 == "alexei"' | wc -l  > answer_first.info
ps -aux | awk '$1 == "alexei" {print $2":"$11}' >> answer_first.info
