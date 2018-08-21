# Update-ServerMembership
# Copyright 2018, Dr. Matthew R. Kisow
#
# This script runs as a scheduled task and will remove any disabled
# "server" object(s) from the "Servers" group and add any new "server"
# object(s) to the "Servers" group.

# Install the Active Directory management objects.
Import-Module ActiveDirectory

# Setting a search pattern for all disabled computer objects that are servers and remove them from the group servers.
Get-ADComputer -Filter "(Enabled -eq 'False') -and (OperatingSystem -Like 'Windows Server*')" | ForEach-Object {Remove-ADPrincipalGroupMembership –Identity $_ –MemberOf Servers –Confirm:$false}

# Setting a search pattern for all enabled computer objects that are servers and adding them to the group servers.
Get-ADComputer -Filter "(Enabled -eq 'True') -and (OperatingSystem -Like 'Windows Server*')" | ForEach-Object {Add-ADPrincipalGroupMembership -Identity $_ -MemberOf Servers}
