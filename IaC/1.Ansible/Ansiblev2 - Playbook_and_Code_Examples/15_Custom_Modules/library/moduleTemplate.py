#!/usr/bin/python

# Eric Chou (ericc@a10networks.com, Twitter @ericchou) 

DOCUMENTATION = """
---
"""

EXAMPLES = """
"""

def main():

    # AnsibleModule API from ansible.module_utils.basic
    # for ingesting Playbook inventory parameters 
    module = AnsibleModule(
        argument_spec = dict(
        )
    )
    
    # Signals module exit
    module.exit_json(changed=False, msg="Foo Bar")

# Ansible standard for import at the bottom instead of top
from ansible.module_utils.basic import *
main()

