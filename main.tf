terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

resource "virtualbox_vm" "mage" {
    count = 1
    name = "${format("node_debian-%02d", count.index+1)}"
    image = "https://app.vagrantup.com/debian/boxes/bookworm64/versions/12.20231211.1/providers/virtualbox/unknown/vagrant.box"
    cpus = 2
    memory = "1024 mib"
    network_adapter {
      type = "nat"
    }
}