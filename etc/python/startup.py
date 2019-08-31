# -*- coding: utf-8 -*-

# Python 2/3
from __future__ import unicode_literals, print_function, absolute_import

# Imports from std
import os
import sys
import json
import csv
import random
import tempfile
from pprint import pprint

# Imports from 3rd party
try:
    import requests
except ImportError:
    pass

# alias
p = print
pp = pprint
