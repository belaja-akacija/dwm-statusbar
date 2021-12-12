import time
import os
import sys

def main():
    r = 0
    x = 0
    os.system("clear")
    # stringlist = list(format(sys.stdin.read())) # Comment
    # stringlist = list("String to scroll!   ") # Comment
    stream = os.popen("cmus-remote -Q | grep 'file' | sed -e 's/file\s\/.\+\///g' -e 's/\..\+//g'") # Uncomment
    stringlist = list(stream.read().strip() + "      ")# Uncomment
    while (r <= len(stringlist)):
        stringlist.append(stringlist[x])
        xsetrooter = "".join(stringlist) + "..."
        os.system("xsetroot"+" -name "+"'"+xsetrooter[:]+"'") # adjust the width of the textbox in [:]; ex. [:10] -- from index 0 to 10
        # print("".join(stringlist), end='')
        stringlist.remove(stringlist[0])
        time.sleep(0.25)
        # print('\r', end='')
        ++x
        ++r

main()
