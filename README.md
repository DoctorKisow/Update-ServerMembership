# Update-ServerMembership
Power shell script that updates server membership to a group.

# Update-ServerMembership
# Version 0.0.1
# Copyright 2018, Dr. Matthew R. Kisow

This script runs as a scheduled task and will remove any disabled "server" object(s) from the "Servers" group and add any new "server" object(s) to the "Servers" group.

1. Create an Active Directory group named "Servers".
2. In windows scheduler create a new scheduled task and call it "Update-ServerMembership".
   a. On the Actions tab, create a new action with the following properties:
      Action:                     Start a program
      Program/script:             C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
      Add arguements (optional):  ExecutionPolicy Bypass -File "<script location>\Update-ServerMembership.ps1"
   b. On the Triggers tab, create a new trigger with the following properties:
      Begin the task:   On a schedule
      Choose the One time radio button, select <any date> and <any time>.
      Repeat task every 8 hours for a duration of indefinately.
  
  NOTES: Yes there is a drop-down list for the repeat task; you can type in any number you want for the repeat hours.
         Yes the <script location> can be a UNC path.

