import requests
import os
import json

KEY = os.getenv("LI_API_KEY")
passw = os.getenv("SERVER_PASSWORD")

r = requests.post(
    "https://api.linode.com/v4/linode/instances",
    json={
        "type": "g6-nanode-1",
        "region": "eu-central",
        "image": "linode/ubuntu22.10",
        "root_pass": passw,
        "label": "idkkkkk",
        "authorized_keys": [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDO3LR8FuwK6aX2cjl6U7SPu5kMB/1vujs6n4+4nZyzGDj7gQ9r3Zp5oBZK/t88f9i8Wla9ONr6UavS93rnXZDojpeZbVKyfFXfhsXz8VdG64iCieLWqXu+/aHsbaFYJdpQbOxyDxqhqTjQhfF8Guc6oAqkgsKVHjojnALqs/aDeRudSHICR738Ig3YvxHrT5zNy/lS+305lFiy0Dugo35d4IIp0uVJsMEzvWvBrks/IknvrrvQaN15acef0mDCMCdNyZGBkHNnIT+uTMAwqs8OoaH4kSv7NrSWCCsmXtdpJGJeAzTZVyhG+y86fTvi3Uo5HbOL223as5XacE85pb7xyMByXHJEICpmVlwsgKWKa724LlCJ8Z77FlQHy3yLWTxI8clHm4s/fbfmQHrhLnptMEBY2+LX2ArlfIiOtwR4w9mmtyYf7536C9+Luv2S7A3PwD3OR1dd2sSNwnq4a1yANvqa7EqWmAginnIhjiah2mg01mNaqYrOMa3EN9JtKJ8="
        ],
    },
    headers={
        "Accept": "*/*",
        "Authorization": f"Bearer {KEY}",
    },
)

ipADDr = json.loads(r.content)["ipv4"][0]
print(ipADDr)
