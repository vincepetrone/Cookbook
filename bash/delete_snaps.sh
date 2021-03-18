#!/bin/bash

# govc - go command-line utility based on govmomi library for interacting with vSphere API
# govc man page - https://github.com/vmware/govmomi/blob/v0.24.0/govc/USAGE.md

DELAY=120
active=no
snap_name="before-os-patch"
snap_file=./snapfile.txt

[[ -s $snap_file ]] || { echo "No snapshots to delete" ; exit ; }

cat $snap_file
echo ; read -p "Is this correct? "

[[ $REPLY =~ ^[Yy] ]] || { echo Bye ; exit ; }

for srv in $(<$snap_file) ; do
	if govc snapshot.tree -vm $srv | grep -q "$snap_name" ; then   
		echo "deleting snapshot for $srv"
		govc snapshot.remove -vm $srv "$snap_name" &
		active=yes
    		sleep $DELAY
	else
		echo "No snapshot found for $srv - skipping"
		continue
	fi
done

[[ $active == "no" ]] && exit

printf "\nwaiting for delete tasks to complete\n\n"
wait
govc tasks -n 100 | grep ^RemoveSnapshot
