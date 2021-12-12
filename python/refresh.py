# Refresh commands at a certain interval using multithreads
# work in progress

import time
import os
import sys
import threading

def refresher(cmd, interval):
    while (True):
        stream = os.popen(cmd + " | grep 'file' | sed -e 's/file\s\/.\+\///g' -e 's/\..\+//g'")
        print(stream.read().strip(), end='')
        print('\r', end='')
        # time.sleep(interval)

def print_world(string):
    # time.sleep(3)
    print(string)

if __name__ == "__main__":
    #creating thread
    t1 = threading.Thread(target=refresher, args=("cmus-remote -Q",1))
    t2 = threading.Thread(target=print_world, args=("World",))

    # starting threads
    t1.start()
    t2.start()

    # wait until threads completely executed
    t1.join()
    t2.join()

    # both threads completely exectued
    print("Done!")
