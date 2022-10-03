sudo mdadm --detail --scan
cat /proc/mdstat 
sudo mdadm --stop /dev/md0 
sudo mdadm --assemble --scan --verbose
sudo mdadm --detail --scan
cat /proc/mdstat
sudo mount /dev/md0 carpeta-raid1/
cd carpeta-raid1/
ls -als
