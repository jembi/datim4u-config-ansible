#!/bin/bash

ssh-keygen -R [127.0.0.1]:2222
vagrant destroy -f && vagrant up
./test-with-vagrant.global.sh