#!/usr/bin/env python

'''

Invert 2nd half of leaf trace i.o.t. achieve a continuous cyclic trace

x imr
@ 160905

'''

from __future__ import print_function
import os

def fname(leaf):
    cwd = os.getcwd()
    TOP = cwd + '/newleaves'
    path = TOP + '/leaf' + str(leaf)
    base = 'leaf' + str(leaf) + '.txt'
    print(path)
    print(base)
    trace = path + '/' + base
    return trace

def check_file_exists(trace):
    try:
        os.path.isfile(trace)
    except:
        print('File %s does not exist ]:', trace)

def count_lines(trace):
    ln_cnt = sum (1 for line in open(trace))
    return ln_cnt

def trace2signal(trace):
    ''' Read file into an array '''
    signal = []
    with open(file) as fp:
        for line in fp:
            line = int(line)
            signal.append(line)
    return signal

def zero_crossing(signal):
    ''' Scan a vector, return the index at which the zero point is crossed '''
    cnt = 0
    for i in signal:
        while (cnt >= 0):
            cnt += 1
        # Found the zero crossing when the array drops below zero
        zero_crossing_index = cnt
        break
    return zero_crossing_index

def invert(signal):
    # Get length of trace
    ln_cnt = count_lines(signal)

    # Init array for second half of trace
    half = int(ln_cnt / 2)
    # j = np.array((1, ln_cnt - half))
    # XXX: half = zero_crossing(signal)

    # Slice the 2nd half & reverse it
    a_fwd = signal[half:]
    print(a_fwd.dtype())
    a_rev = a_fwd[::-1]
    print(a_fwd[0])
    # print(a_fwd[0], a_fwd[-1])
    # print(a_rev[0], a_rev[-1])



    # with open(file) as fp:
    #     for i,line in fp:
    #         # Populate 2nd half array backwards
    #         if i >= half:
    #             j[i]

def main():
    leaves = [1] #, 2, 3, 4, 5, 6]
    for leaf in leaves:
        print(leaf)
        trace = fname(leaf)
        check_file_exists(trace)
        signal = trace2signal(trace)
        invert(signal)

def test():
    x = [0,2,4,-1,-2,-3]
    zero_crossing_index = zero_crossing(x)
    print zero_crossing_index

if __name__ == '__main__':
    # main()
    test()
