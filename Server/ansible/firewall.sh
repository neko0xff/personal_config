inventory=cnServers
playbook1=host_firewall.yml
playbook2=container_firewall.yml
ansible-playbook -i $inventory $playbook1
ansible-playbook -i $inventory $playbook2