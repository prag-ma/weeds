#!/usr/bin/env python

'''

Invert 2nd half of leaf trace i.o.t. achieve a continuous cyclic trace

x imr
@ 160905

'''

from __future__ import print_function
import os

trace = '/newleaves/leaf1/leaf1.txt'

def fname(leaf):
    cwd = os.getcwd()
    TOP = cwd + '/newleaves'
    path = TOP + '/leaf' + str(leaf)
    # base = os.path.basename('leaf' + str(leaf) + '.txt')
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

def file2signal(file):
    signal = []
    with open(file) as fp:
        for line in fp:
            line = int(line)
            signal.append(line)
    return signal

def invert_trace(signal):
    # Get length of trace
    ln_cnt = count_lines(signal)

    # Init array for second half of trace
    half = int(ln_cnt / 2)
    # j = np.array((1, ln_cnt - half))

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
        file2signal(trace)
        invert_trace(trace)

if __name__ == '__main__':
    main()
