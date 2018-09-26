#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Dec 16 22:20:40 2017

@author: shijie
"""

import numpy as np
import glob
import scipy.misc
import h5py
import scipy.ndimage
import cv2

def data_setup(path,savepath):
    files_y = glob.glob(path + '*.bmp')
    img_size = 32
    stride = 14
    X = []
    Y = []
#    for (file_X,file_y) in zip(files_X,files_y):
    for file_y in files_y:
        tmp_y = scipy.misc.imread(file_y, mode='YCbCr').astype(np.float)
        tmp_X = create_LR(tmp_y,3)
        h,w,_ = tmp_y.shape
#        print(1)
        for x in range(0, h-img_size+1, stride):
            for y in range(0, w-img_size+1, stride):
                sub_input = tmp_X[x:x+img_size, y:y+img_size] # [32 x 32]
                sub_label = tmp_y[x:x+img_size, y:y+img_size] # [32 x 32]
                if sub_input.shape == (32,32,3) and sub_label.shape == (32,32,3):
                    X.append(sub_input)
                    Y.append(sub_label)

#    print((np.array(X)).shape)
    with h5py.File(savepath, 'w') as hf:
        hf.create_dataset('data', data=np.asarray(X))
        hf.create_dataset('label',data=np.asarray(Y))
#    return X
        
def create_LR(image,scale):
    label_ = modcrop(image, scale)
    
    # Must be normalized
    label_ = label_ / 255.
    input_ = scipy.ndimage.interpolation.zoom(label_, (1./scale), prefilter=False)
    input_ = scipy.ndimage.interpolation.zoom(input_, (scale/1.), prefilter=False)       
    return input_

def modcrop(image, scale=3):
  """
  To scale down and up the original image, first thing to do is to have no remainder while scaling operation.
  
  We need to find modulo of height (and width) and scale factor.
  Then, subtract the modulo from height (and width) of original image size.
  There would be no remainder even after scaling operation.
  """
  if len(image.shape) == 3:
    h, w, _ = image.shape
    h = h - np.mod(h, scale)
    w = w - np.mod(w, scale)
    image = image[0:h, 0:w, :]
  else:
    h, w = image.shape
    h = h - np.mod(h, scale)
    w = w - np.mod(w, scale)
    image = image[0:h, 0:w]
  return image  

def color_convert(test):
    imgYCC = cv2.cvtColor(test, cv2.COLOR_YCrCb2RGB)
    return imgYCC