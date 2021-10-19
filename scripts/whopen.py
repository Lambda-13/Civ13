import os
import shutil
import time
import requests

currdir = os.path.dirname(os.path.abspath(__file__))
lines = open(os.path.join(currdir, "token.txt"))
all_lines = lines.readlines()
token = all_lines[1]
token = token.replace("\n", "")
token = token.replace("", "")
print(token)

from discord import Webhook, RequestsWebhookAdapter

webhook = Webhook.from_url(token, adapter=RequestsWebhookAdapter())
webhook.send("<@&896361299057983519> запустились, ссылка <byond://195.140.146.172:15/>")

