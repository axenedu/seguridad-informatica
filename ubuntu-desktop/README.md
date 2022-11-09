# Base para ubuntu desktop box

Se necesita poner la clave insegura en ~/.ssh/authorized_keys antes de empaquetar el box

[Vagrant insecure keys](https://github.com/hashicorp/vagrant/tree/main/keys)

Listar vms
```shell
VBoxManage list vms
```

```shell
vagrant package --base (vmname) --output ubuntu-focal64-desktop.box
```
