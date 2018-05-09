# Ansible scripts for DATIM4U OpenHIM and mediator setup

To configure the installation ensure that the `variables.yml` file is edited to reflect he environment you want to deploy to. In particular make sure the `openhim_server_public_hostname` is set correctly to a public DNS address or IP address of the server you are installing to otherwise you will not be able to login to the OpenHIM-console.

To execute the setup execute add the IP addresses that you wish to run this agaisnt to the inventory file, then:
```bash
ansible-playbook -i inventory -b -u <your_ssh_user> playbook.yml
```

Note: the loading of config metadata for the OpenHIM and mediator will only occur on the first run of this script. There after the changes must be made in the OpenHIM Console itself.

After the setup is done some manual config will still need to take place:

* The Client certificates (full chain) need to be added to the keystore and assigned to client created, also their basic auth passwords must be reset from the default of 'test'.
* The OpenHIM global certificates full chain needs to be added to the keystore
* The Certificate that the node OpenHIM (the one that was installed) needs to be changed to an active lets encrypt certificate
* The /tls folder of the openhim DATIM mediator will need to be updated with its proper cert and key file and a ca file for the Global IL.

## To test with vagrant

To set a new test vm, from the `test/` directory run:
```bash
vagrant up && ./test-with-vagrant.sh
```

To start afresh with a new vm
```bash
./re-up-vagrant.sh
# during execution you will have to choose the network vagrant should bridge to
# and re-accept the connection to the vagrant host
```
