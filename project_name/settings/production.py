# -*- coding: utf-8 -*-

from .base import *

DEBUG = False

try:
    from .local import *
except ImportError:
    pass
