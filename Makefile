.PHONY: help vagrant provision deploy

help:
	@echo 'Available targets:'
	@echo '  make vagrant'
	@echo '  make provision'
	@echo '  make deploy'

vagrant:
	ssh-add
	vagrant up --provision

provision:
	ansible-playbook -i hosts.ini playbook.yml --skip-tags deploy

deploy:
	ssh-add
	ansible-playbook -i hosts.ini playbook.yml --tags deploy
