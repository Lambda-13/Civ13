import sys
import os
import shutil
import time
import requests
import signal

def getListOfFiles(dirName):
    # create a list of file and sub directories 
    # names in the given directory 
    listOfFile = os.listdir(dirName)
    allFiles = list()
    # Iterate over all the entries
    for entry in listOfFile:
        # Create full path
        fullPath = os.path.join(dirName, entry)
        # If entry is a directory then get the list of files in this directory 
        if os.path.isdir(fullPath):
            allFiles = allFiles + getListOfFiles(fullPath)
        else:
            allFiles.append(fullPath)
                
    return allFiles

currdir = os.path.dirname(os.path.abspath(__file__))
lines = open(os.path.join(currdir,"paths.txt"))
all_lines = lines.readlines()
mdir = all_lines[1]
mdir = mdir.replace("\n", "")
mdir = mdir.replace("mdir:", "")
cdir = all_lines[2]
cdir = cdir.replace("\n", "")
cdir = cdir.replace("cdir:", "")
port = all_lines[3]
port = port.replace("\n", "")
port = port.replace("port:", "")

if len(sys.argv) == 1:
	print("Not enough args provided.")
	sys.exit()

#handle = open(os.path.join(currdir, "hook.txt"))
#token = handle.read()
#handle.close()

currdir = os.path.dirname(os.path.abspath(__file__))
lines = open(os.path.join(currdir,"token.txt"))
all_lines = lines.readlines()
hook = all_lines[1]
hook = hook.replace("\n", "")
hook = hook.replace("hook:", "")

sendtext = sys.argv[1]

from discord import Webhook, RequestsWebhookAdapter

webhook = Webhook.from_url(hook, adapter=RequestsWebhookAdapter())
webhook.send('"s{}s"'.format(sendtext))