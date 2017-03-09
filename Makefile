help:
	@echo 'Use make provision or make deploy'

provision:
	ansible-playbook -i hosts.ini playbook.yml --skip-tags deploy

deploy:
	ssh-add
	ansible-playbook -i hosts.ini playbook.yml --tags deploy

vagrant:
	ssh-add
	vagrant up --provision

.PHONY: help provision deploy vagrant
