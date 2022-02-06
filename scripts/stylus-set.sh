#!/bin/bash
xinput map-to-output `xinput | grep stylus | awk -F "id=" '{print $2}' | awk '{print $1}'` DP-4
