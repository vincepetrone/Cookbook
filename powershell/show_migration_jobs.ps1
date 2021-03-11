$count=1
cls
do {
    write-host -Foreground Gray (get-date -Format "dddd MM/dd/yy HH:mm:ss")
    write-host -Foreground Green "`nRunning Migration Jobs:`n" 

    if ((get-task | where Name -match vmotion).count -EQ 0) {
        write-host -Foreground Gray "No migration jobs running at this time."
    } 
    else {
        foreach ($migration_job in (get-task | where Name -match vmotion)) {
            if ($migration_job.Count -eq 0) { write-host "no migration jobs running" ; continue }
            $vm_id = $migration_job.ObjectID
            $task_complete = $migration_job.PercentComplete
            $task_state = $migration_job.State
            $vm_name = (get-vm -Id $vm_id).Name
            write-host -Foreground DarkYellow $vm_name $task_state $task_complete"% complete"
        }
    }
$count += 1
sleep 5
cls
} until ($count -gt 10000) 
