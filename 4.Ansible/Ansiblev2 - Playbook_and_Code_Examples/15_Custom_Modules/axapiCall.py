#!/usr/bin/python

import requests, json

a10_device = '192.168.199.152'
base_url = 'https://'+ a10_device
username = 'admin'
password = 'a10'

# Acquire athorization token
auth_headers = {'content-type': 'application/json'}
auth_payload = {"credentials": {"username": username, "password": password}}
auth_endpoint = '/axapi/v3/auth'
url = base_url + auth_endpoint
r = requests.post(url, data=json.dumps(auth_payload), headers=auth_headers, verify=False)
signature =  r.json()['authresponse']['signature']
print("Signature: " + signature)

# Headers beyond this point should include the authorization token
common_headers = {'Content-type' : 'application/json', 'Authorization' : 'A10 {}'.format(signature)}

# Simple GET 'show version' example
version_endpoint = '/axapi/v3/version/oper'
url = base_url + version_endpoint
result = requests.get(url, headers=common_headers, verify=False)
hw = result.json()['version']['oper']['hw-platform']
sw = result.json()['version']['oper']['sw-version']
data = json.dumps({
    "Device_Info": {
        "Hardware": hw,
        "Software": sw
    }
})
print(data)

# Log off
logoff_endpoing = '/axapi/v3/logoff'
url = base_url + logoff_endpoing
print("Log off")
r = requests.post(url, headers=common_headers, verify=False)


