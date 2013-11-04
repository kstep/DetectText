#!/usr/bin/env python

import sys
sys.path.append('/usr/lib/python2.7/site-packages')

import textdetection
from cv2 import cv
import cv2

#pic = cv.LoadImage('/home/kstep/pics/android.jpg')
pic = cv2.imread('/home/kstep/pics/android.jpg')
textpic = textdetection.detect_text(pic, False)
print textpic

