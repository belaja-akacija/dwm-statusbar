import time
import os
import sys

def main():
    r = 0
    x = 0
    stream = os.popen("cmus-remote -Q | grep 'file' | sed -e 's/file\s\/.\+\///g' -e 's/\..\+//g'") # The command to run
    stringlist = list(stream.read().strip() + "      ") # adjust whitespace in quotes
    while (r <= len(stringlist)):
        stringlist.append(stringlist[x])
        xsetrooter = "".join(stringlist) # adjust spacing in the quotes
        os.system("xsetroot"+" -name "+"'"+xsetrooter[:]+"'") # adjust the width of the textbox in [:]; ex. [:10] -- from index 0 to 10
        stringlist.remove(stringlist[0])
        time.sleep(0.25)
        ++x
        ++r

main()
