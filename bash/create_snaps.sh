#!/bin/bash

# govc - go command-line utility based on govmomi library for interacting with vSphere API
# govc man page - https://github.com/vmware/govmomi/blob/v0.24.0/govc/USAGE.md

DELAY=30
snap_name="before-os-patch"
active=no
declare -a vm_list=(
smcserv
brutus
pesto
eldorado
)

for i in ${vm_list[@]} ; do
	echo $i 
done
echo
read -p "Is this correct? "

[[ $REPLY =~ ^[Yy] ]] || { echo Bye ; exit ; }

for vm in ${vm_list[@]} ; do
	if govc snapshot.tree -vm $vm | grep -q "$snap_name" ; then
		echo "$vm has snapshot $snap_name - skipping"
		continue
	fi
	govc snapshot.create -vm "$vm" $snap_name &
        echo "$vm - started"
        active=yes
	sleep $DELAY
done

[[ $active == "no" ]] && exit

printf "\nWaiting for snapshots to complete\n\n"
wait
govc tasks -n 100 | grep ^CreateSnapshot
