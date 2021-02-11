Vagrant.configure("2") do |config|

$script = <<-'SCRIPT'
iptables -I OUTPUT -o enp0s3 -j DROP
iptables -I INPUT -i enp0s3 -j DROP
iptables -I INPUT -i enp0s3 -p tcp --dport 22 -j ACCEPT
iptables -I OUTPUT -o enp0s3 -p tcp --sport 22 -j ACCEPT
iptables -I OUTPUT -o lo -j ACCEPT
iptables -I INPUT -i lo -j ACCEPT
rm /etc/resolv.conf
echo "nameserver 1.1.1.1" >/etc/resolv.conf
echo "nameserver 8.8.8.8" >>/etc/resolv.conf
SCRIPT

$scriptAlways = <<-'SCRIPT'
sudo ip r del default via 10.0.2.2
echo 1 > /proc/sys/net/ipv4/ip_forward
SCRIPT

  config.vm.provision "todas", type: "shell" do |s|
    s.inline = $script
  end 

  config.vm.provision "todas_siempre", type: "shell",
	run: "always" do |ts|
    ts.inline = $scriptAlways
  end 
  
  #config.vm.synced_folder "./", "/vagrant_data"

  config.vm.define "fachada", primary:true do |fachada|
	fachada.vm.box = "ubuntu/focal64"
	fachada.vm.hostname = "fachada"
	
	$scriptFachada = <<-'SCRIPT'
	echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
	iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE
	SCRIPT
	fachada.vm.provision "fachada_once", type: "shell" do |fo|
	  fo.inline = $scriptFachada
	end

	fachada.vm.provision "conectividad", type: "shell",
		inline: "ping -c 2 google.com"

	fachada.vm.network "public_network", 
		use_dhcp_assigned_default_route: true
	fachada.vm.network "private_network", ip: "192.168.120.1",
		virtualbox__intnet: "lan"
	fachada.vm.network "private_network", ip: "192.168.121.1",
                virtualbox__intnet: "dmz"
  end

  #Para levantar la maquina se requiere vagrant up lan
  config.vm.define "lan", autostart:false do |lan|

        lan.vm.box = "ubuntu/focal64"
	lan.vm.hostname = "lan"

	$scriptGateway = <<-'SCRIPT'
       		ip r add default via 192.168.120.1
		ping -c 2 192.168.120.1
		ping -c 2 www.google.com
  	SCRIPT
	lan.vm.provision "lan_all", type: "shell", run: "always" do |lgw|
          lgw.inline = $scriptGateway
        end
	
	lan.vm.network "private_network", ip: "192.168.120.2",
		virtualbox__intnet: "lan"
  end

  #Para levantar la maquina se requiere vagrant up dmz 
  config.vm.define "dmz", autostart:false do |dmz|
        dmz.vm.box = "ubuntu/focal64"
	dmz.vm.hostname = "dmz"

	$scriptGateway = <<-'SCRIPT'
		ip r add default via 192.168.121.1
		ping -c 2 192.168.121.1
		ping -c 2 google.com
        SCRIPT
        dmz.vm.provision "lan_all", type: "shell", run: "always" do |dgw|
          dgw.inline = $scriptGateway
        end

	dmz.vm.network "private_network", ip: "192.168.121.2",
                virtualbox__intnet: "dmz"
  end

end
