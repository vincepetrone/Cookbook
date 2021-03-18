#!/bin/bash

# govc - go command-line utility based on govmomi library for interacting with vSphere API
# govc man page - https://github.com/vmware/govmomi/blob/v0.24.0/govc/USAGE.md

snap_name="before-os-patch"
snap_file=./snapfile.txt
declare -a vm_list=( $(cat ./vm_list.txt) )

>$snap_file
for srv in ${vm_list[@]} ; do
	if govc snapshot.tree -vm $srv | grep -q "$snap_name" ; then      
		echo $srv | tee -a $snap_file
	fi
done
