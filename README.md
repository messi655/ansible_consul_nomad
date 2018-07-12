Automation deploy Nomad and Consul

# Requirement
- Ansible ansible 2.4.3.0
- Number of control nodes must "1 <= control_nodes <=3"

# Prepare
- Change variables in group_vars/all
- Change variables in roles/[role_name]/defaults/main.yml
- Change hosts in inventory/[environment]/hosts

# Run

```
ansible-playbook --private-key /path/to/keys.pem -i inventory/[environment]/example site.yml
```

# Test
Add below to site.yml and run playbook
```
- hosts: test
  remote_user: centos
  sudo: true
  roles:
   - { role: test, tags: test }
``` 
Login to each of Node in cluster and check `docker ps -a`

# Deploy Consul Template with HAProxy
```
ansible-playbook --private-key /path/to/keys.pem -i inventory/[environment]/example consul-template.yml
```


# Reference:
- Source: https://github.com/nickvth/ansible-consul-nomad