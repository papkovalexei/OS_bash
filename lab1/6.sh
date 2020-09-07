#!/bin/bash

awk '$3 == "(WW)", $3 = "Warning:"' ~/.local/share/xorg/Xorg.0.log > full.log
awk '$3 == "(II)", $3 = "Information:"' ~/.local/share/xorg/Xorg.0.log >> full.log

cat full.log
