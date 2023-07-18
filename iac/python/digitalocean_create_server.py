import requests
import os
import json
import time

do_api_key = os.getenv('DO_API_KEY')
do_base_url= "https://api.digitalocean.com/v2"
with open("../cloudinit/cloud-init.yml") as conf:
    do_cloud_init= conf.read()

# print(do_cloud_init)

# Create Server Request

create_server_requests = requests.post(f"{do_base_url}/droplets",headers={
    "Authorization": f"Bearer {do_api_key}",
},json={
  "name": "something",
  "size": "s-1vcpu-1gb",
  "image": "ubuntu-22-04-x64",
  "user_data": do_cloud_init,
  "ssh_keys": [
    "55:79:b3:e9:e2:a4:c2:8d:0b:66:55:e5:5e:cd:e7:07"
  ]
})

follow_up_request_endpoint = json.loads(create_server_requests.content)['links']['actions'][0]['href']

follow_up_status="waiting"
resource_id=0
while (follow_up_status != "completed"):
    follow_up_status_request= requests.get(follow_up_request_endpoint,headers={
        "Authorization": f"Bearer {do_api_key}",
    })

    follow_up_status = json.loads(follow_up_status_request.content)['action']['status']
    if follow_up_status=="completed":
        resource_id=json.loads(follow_up_status_request.content)['action']['resource_id']
    time.sleep(10)

droplet_info_request= requests.get(f"{do_base_url}/droplets/{resource_id}",headers={
    "Authorization": f"Bearer {do_api_key}",
})

droplet_ip= json.loads(droplet_info_request.content)['droplet']['networks']['v4'][0]['ip_address']

print(droplet_ip)