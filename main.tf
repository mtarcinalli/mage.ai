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
    image = "https://app.vagrantup.com/debian/boxes/bullseye64/versions/11.20220912.1/providers/virtualbox.box"
    cpus = 2
    memory = "1024 mib"
    network_adapter {
      type = "nat"
    }
}