#!/bin/bash
VERSION=${1}
sed -i.bak "s/VERSION/$VERSION/g" setup.py
exit 0