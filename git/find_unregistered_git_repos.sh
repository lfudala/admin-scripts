#! /usr/bin/env bash
# 
# Find all git repositories that are not registered with myrepos
find . -type d -exec test -d {}/.git \; -prune -a -\( -execdir grep -q {} ~/.mrconfig \; -o -okdir mr register '{}' \; -\)
