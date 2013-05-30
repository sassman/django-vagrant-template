# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.network :private_network, ip: "192.168.10.159"
    config.vm.network :forwarded_port, guest: 8000, host: 8000, auto_correct: true
    config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true

    config.vm.synced_folder "./", "/home/vagrant/{{ project_name }}", :nfs => (Vagrant::Util::Platform.windows? ? false:
    true),
    :extra => 'dmode=777,fmode=777'

    config.vm.box = "ubuntu-server-1204-x64-vbox4210"
    config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"

    config.vm.provider :virtualbox do |vbox|
        vbox.customize [
            "modifyvm", :id,
            "--memory", "512",
            "--cpus",   "2"
        ]
    end

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet"
        puppet.manifest_file = "app.pp"
        puppet.module_path = "puppet/modules"
        # puppet.options = "--verbose --debug"
    end
end
