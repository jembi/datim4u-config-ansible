#/bin/bash

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -b ../playbook.global.yml -v