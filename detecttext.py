# -*- enccoding=utf-8 -*-
__author__ = 'Konstantin Stepanov <me@kstep.me>'

__all__ = ['text_detection', 'IplImage']

from ctypes import cdll, Structure, c_int, c_char, c_char_p, POINTER, c_bool, c_double, c_double, c_void_p
from cv2.cv import iplimage

class IplROI(Structure):
    _fields_ = [
            ('coi', c_int),
            ('xOffset', c_int),
            ('yOffset', c_int),
            ('width', c_int),
            ('height', c_int),
            ]

class IplImage(Structure):
    _fields_ = [
            ('nSize', c_int),
            ('ID', c_int),
            ('nChannels', c_int),
            ('alphaChannel', c_int),
            ('depth', c_int),
            ('colorModel', c_char * 4),
            ('channelSeq', c_char * 4),
            ('dataOrder', c_int),
            ('origin', c_int),
            ('align', c_int),
            ('width', c_int),
            ('height', c_int),
            ('roi', POINTER(IplROI)),
            ('maskROI', c_void_p),
            ('imageId', c_void_p),
            ('tileInfo', c_void_p),  # struct _IplTileInfo
            ('imageSize', c_int),
            ('imageData', c_char_p),
            ('widthStep', c_int),
            ('BorderMode', c_int * 4),
            ('BorderConst', c_int * 4),
            ('imageDataOrigin', c_char_p),
            ]

lib = cdll.LoadLibrary("./libTextDetection.so")
text_detection = lib.text_detection
text_detection.restype = IplImage
text_detection.argtypes = [POINTER(IplImage), c_bool, c_double, c_double]

