# -*- mode: ruby -*-
# vi: set ft=ruby :


domain = 'sample.io'

# use puppetlabs provided boxes from http://puppet-vagrant-boxes.puppetlabs.com

$ubuntu_provision_script = <<SCRIPT
echo "`date`: Begin Shell Provisioning for Ubuntu"
apt-get update
echo "`date`: Done with Shell Provisioning"
SCRIPT

$centos_provision_script = <<SCRIPT
echo "`date`: Begin Shell Provisioning for CentOS"
echo "`date`: Done with Shell Provisioning"
SCRIPT

puppet_nodes = [
  # {:hostname => 'puppet',  :ip => '172.16.32.10', :box => 'precise64', :fwdhost => 8140, :fwdguest => 8140, :ram => 512},
  {:hostname => 'standardhost', :ip => '172.16.32.11', :box => 'ubuntu-server-12042-x64-vbox4210', :provision_script => $ubuntu_provision_script },
  {:hostname => 'prodservices', :ip => '172.16.32.12', :box => 'centos-65-x64-virtualbox-puppet', :provision_script => $centos_provision_script },
]


Vagrant.configure("2") do |config|
  puppet_nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.box = node[:box]
      node_config.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/' + node_config.vm.box + '.box'
      node_config.vm.hostname = node[:hostname] + '.' + domain
      node_config.vm.network :private_network, ip: node[:ip]

      if node[:fwdhost]
        node_config.vm.network :forwarded_port, guest: node[:fwdguest], host: node[:fwdhost]
      end

      memory = node[:ram] ? node[:ram] : 256;
      node_config.vm.provider :virtualbox do |vb|
        vb.customize [
          'modifyvm', :id,
          '--name', node[:hostname],
          '--memory', memory.to_s
        ]
      end


      node_config.vm.provision "shell", inline: node[:provision_script]

      node_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'provision/manifests'
        puppet.module_path = 'provision/modules'
        puppet.manifest_file  = "nodes.pp"
      end

    end
  end
end
