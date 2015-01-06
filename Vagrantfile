Vagrant.configure("1") do |config|

  config.vm.box = "trusty64"
  config.vm.box_url = "http://files.vagrantup.com/trusty64.box"

  config.vm.forward_port 80, 8080
  config.vm.forward_port 5000, 5000
  config.vm.forward_port 2003, 2003
  config.vm.forward_port 2003, 2003, { :protocol => 'udp' }
  config.vm.forward_port 2004, 2004
  config.vm.forward_port 8125, 8125, { :protocol => 'udp' }

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "base.pp"
    puppet.options = "--verbose --debug --trace"
  end
end