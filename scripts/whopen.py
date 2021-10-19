import os
import requests

handle = open("token.txt", "r")
token = handle.read()
print("Запускаем...")
handle.close()

from discord import Webhook, RequestsWebhookAdapter

webhook = Webhook.from_url(token, adapter=RequestsWebhookAdapter())
webhook.send("<@&896361299057983519> запустились, ссылка <byond://195.140.146.172:15/>")