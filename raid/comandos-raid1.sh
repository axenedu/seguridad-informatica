sudo fdisk -l
sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sdd /dev/sdc 
sudo fdisk -l
cat /proc/mdstat 
sudo mkfs.ext4 /dev/md0
mkdir carpeta-raid1
sudo  mount /dev/md0 carpeta-raid1/
cd carpeta-raid1/
ls -als
sudo chown vagrant:vagrant ./
ls -als
touch test1
touch test2
echo test1 > test1
echo test2 > test2
sudo mdadm --detail /dev/md0 
sudo vim /etc/mdadm/mdadm.conf 
sudo mdadm --detail
sudo mdadm --detail --scan
sudo mdadm --detail --scan >> /etc/mdadm/mdadm.conf 
sudo su
sudo  cat /etc/mdadm/mdadm.conf 
sudo  vim /etc/mdadm/mdadm.conf 
sudo update-initramfs -u
echo '/dev/md0 /home/vagrant/carpeta-raid1 ext4 defaults,nofail,discard 0 0' | sudo tee -a /etc/fstab
cat /etc/fstab 
history  --help
history -w /vagrant/comandos-raid1.sh
