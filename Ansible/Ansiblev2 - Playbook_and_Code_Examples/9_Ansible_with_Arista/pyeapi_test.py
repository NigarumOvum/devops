#!/usr/bin/env python

from __future__ import print_function
import pyeapi

pyeapi.load_config('nodes.conf')
node = pyeapi.connect_to('veos-1')
output = node.get_config('running-config')

print(output)

