# -*- mode: ruby -*-
# vi: set ft=ruby :

MACHINES = {
  'debian01' => '192.168.56.101',
}.freeze

Vagrant.configure(2) do |config|
  config.vm.box = 'debian/jessie64'
  config.vm.box_check_update = false

  config.ssh.forward_agent = true
  config.ssh.insert_key = false

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'playbook.yml'
    ansible.verbose = 'v'
    ansible.groups = {
      vagrant: MACHINES.keys
    }
  end

  MACHINES.each do |name, ip|
    config.vm.define name do |host|
      host.vm.hostname = "#{name}.dev"
      host.vm.network 'private_network', ip: ip
      host.vm.provider 'virtualbox' do |box|
        box.name = name
        box.memory = 1024
      end
    end
  end
end
