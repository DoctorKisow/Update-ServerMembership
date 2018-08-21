# Update-ServerMembership
**Update-ServerMembership** - A PowerShell script that updates server membership to a group.  
Matthew R. Kisow, D.Sc. <matthew.kisow@kisow.org>  
Copyright &copy; Kisow Foundation, Inc.&reg; 2018.  

## Getting Started
This script runs as a scheduled task and will remove any disabled "server" object(s) from the "Servers" group and add any new "server" object(s) to the "Servers" group.

## Installation
1. Download the ["_**Update-ServerMembership**_"](https://github.com/DoctorKisow/Update-ServerMembership.git) script.  
   See the **README.md** file located in the Update-ServerMembership directory for the install and scheduling instructions.    
   **NOTE:** Follow Microsoft best-practices for the script folder location.  
2. Create an Active Directory group named **"Servers"**.

## Scheduling
1. In windows scheduler create a new scheduled task and call it **"Update-ServerMembership"**.  
2. On the **Actions** tab, create a new action with the following properties:  
   **Action:**                     Start a program  
   **Program/script:**             C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe  
   **Add arguements (optional):**  ExecutionPolicy Bypass -File "_<script location>_\Update-ServerMembership.ps1"  
     **NOTE:** Yes the _<script location>_ can be a UNC path.  
3. On the Triggers tab, create a new trigger with the following properties:  
   **Begin the task:**             On a schedule  
   Choose the **One time** radio button, select _<any date>_ and _<any time>_.  
   Repeat task every 8 hours for a duration of indefinately.  
     **NOTE:** Yes there is a drop-down list for the repeat task; you can type in any number you want for the repeat hours.
         
## License
License (GPL v3.0)

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

