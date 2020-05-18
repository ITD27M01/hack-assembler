#!/bin/bash
VERSION=$(echo ${1} | awk -F/ '{print $3}')
sed -i.bak "s/VERSION/$VERSION/g" setup.py
exit 0