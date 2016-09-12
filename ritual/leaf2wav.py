#!usr/bin/env python

'''
    leaf2wav.py

    Sonification of leaves.

x imr
@ 160630
'''


from __future__ import division
# import argumentparser as argparse
import numpy as np
import struct
import wave
import math
import os


def file2signal(file, durtot):
    signal = []
    with open(file) as fp:
        for line in fp:
            line = int(line)
            signal.append(line)

    siglen = len(signal)
    repeats = durtot / siglen
    repeats = int(math.floor(repeats))
    repeats = 4
    for r in range(2, repeats):
        signal = np.concatenate((signal,signal), axis=0)
    print len(signal)

    return signal[::-1]


def normalise(x, MAX_INT):
    '''Normalise signal amplitude to specified range (default: MAX_INT16)'''
    maxamp = max(max(x),abs(min(x)))
    amp = MAX_INT/maxamp
    norm = np.zeros(len(x))
    for i in range(len(x)):
        norm[i] = amp*x[i]
    return norm


def wavWrite(signal, wpath, wname, fs, durtot, MAX_INT):
    '''Write mono .wav file of input signal'''
    # Set the .wav parameters
    nchannels = 1
    sampwidth = 2
    framerate = fs
    nframes = durtot
    comptype = 'NONE'
    compname = 'NONE'

    # Write the .wav file
    wav = wave.open(wpath + '/' + os.path.basename(wname),'w')
    wav.setparams((nchannels, sampwidth, framerate, nframes, comptype, compname))
    for s in range(len(signal)):
        if signal[s] > MAX_INT :
            print "WARNING: MAX_INT EXCEEDED @ signal[",s,"] >> CLIP!"
        else:
            wav.writeframes(struct.pack('h', int(signal[s])))
    print "Congratulations!\nYou won a wav...\n", wpath + '/' + os.path.basename(wname)
    wav.close()

def main():
    # wav parameters
    fs = 44100
    durtot = 10*fs
    MAX_INT16 = 32767
    MAX_INT12 = 2047
    MAX_INT8 = 127
    bits = 16
    MAX_INT = MAX_INT16

    ritual_dir = os.path.dirname(os.path.realpath(__file__))
    data_dir = ritual_dir + '/newleaves'
    leaves = ['1'] #, '08', '09', '10']
    for i in leaves:
        leaf = data_dir + '/leaf' + str(i) + '/leaf' + str(i) + '.txt'
        signal = file2signal(leaf, durtot)
        wname = leaf.split('.')[0] + '_fs' + str(fs) + '_b' + str(bits) + '.wav'
        wname = os.path.basename(wname)
        wpath = os.path.dirname(leaf)

        # Normalise signal and write as wav
        signal = normalise(signal, MAX_INT)
        wav = wavWrite(signal, wpath, wname, fs, durtot, MAX_INT)


if __name__ == '__main__':
    # parser = ap.ArgumentParser(description="Leaf sonification")
    # parser.add_argument('--leaves', '-l', type=str, required=False, nargs='+')
    # parsed = parser.parse_args()
    # leaves = parsed.leaves
    main()
