sudo fdisk -l
sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sdd /dev/sdc 
sudo mkfs.ext4 /dev/md0
mkdir carpeta-raid1
sudo  mount /dev/md0 carpeta-raid1/
cp /vagrant/*.jpg carpeta-raid1/
cp /vagrant/*.pn carpeta-raid1/
cp /vagrant/*.png carpeta-raid1/
sudo chown vagrant:vagrant ./carpeta-raid1/
cp /vagrant/*.png carpeta-raid1/
sudo mdadm --detail --scan || sudo tee -a /etc/mdadm/mdadm.conf 
sudo update-initramfs -u
echo '/dev/md0 /home/vagrant/carpeta-raid1 ext4 defaults,nofail,discard 0 0' | sudo tee -a /etc/fstab
exit
ls -als carpeta-raid1/
exit
cd carpeta-raid1/
ls
cd ..
sudo apt install gddrescue 
sudo ddrescue -r 3 /dev/sdd recover/image recover/logfile
mkdir recover
sudo ddrescue -r 3 /dev/sdd recover/image recover/logfile
ls recover/
la -als recover/
sudo apt install foremost 
mkdir ficheros-recuperados
sudo foremost -i /dev/sdd ficheros-recuperados/foremost
cd ficheros-recuperados/
ls
ls -als
sudo ls -als
cd ..
ls
rm -rm output/ recover/
rm -rf output/ recover/
sudo foremost -i /dev/sdd -o ficheros-recuperados/foremost
cd ficheros-recuperados/
ls -als
cd foremost/
sudo chown -R vagrant:vagrant foremost/
cd foremost/
ls
cd png
ls
cd ..
cat audit.txt 
sudo apt install sleuthkit 
cd ..
mmls --help
ls -als
sudo ls output/
rm -rf output/
sudo rm -rf output/
mkdir recover
sudo ddrescue -r 3 /dev/sdd recover/image recover/logfile
mmls recover/image -b
mmls recover/image
ls recover/image 
ls recover/
cat recover/logfile 
mmls recover/image
mmls -i list
mmls -i raw recover/image 
e2fsck -v -f recover/image 
sudo e2fsck -v -f recover/image 
history -w /vagrant/comandos-recovery-img.sh
