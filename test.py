#!/usr/bin/env python

import sys
sys.path.append('/usr/lib/python2.7/site-packages')

from pytextdetection import detect_text
from cv2 import cv
import cv2

#pic = cv.LoadImage('/home/kstep/pics/android.jpg')
pic = cv2.imread('/home/kstep/pics/android.jpg')
textpic = detect_text(pic, False)
print textpic

