#!/bin/bash

################################################################
#
# Crack for SHADOW PASSWORDS.
# Usage:
#	crack.sh SALT ENCRYPTED_PASS WORD_LIST
# Example:
#	crack.sh mAsCaLaZ 8E6sMbq.fRDo6nbQqIh.z1 wordlist.txt
#
# by Zerial - http://blog.zerial.org - fernando@zerial.org
################################################################

__SALT=$1;
__HASH="SHA-512";
__FILE=$3;
__RPWD=$2;
echo "Cracking $__RPWD ...";
echo "Attempts: `wc -l $3 |cut -f1 -d ' '`";

for lista in `cat $__FILE`
do
	pass_temp=`mkpasswd -H $__HASH "$lista" -S $__SALT |cut -f4 -d '$'`;
	#echo "Probing $lista ...";
	if [ "$__RPWD" = "$pass_temp" ]; then
		echo ""
		echo "Password Cracked."
		echo "Decrypted password is: $lista"
		exit 
	fi
	i=`expr $i + 1`;
done
echo "Password not found. :-(";
