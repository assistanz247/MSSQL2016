# Install MSSQL

# Specifying Container Image
FROM microsoft/windowsservercore

#Copy MSSQL SETUP FILES INTO THE CONTAINER
ADD ./source c:/source

# INSTALL DOTNET AND MSSQL 2016

RUN powershell.exe -command \

install-windowsfeature -name NET-Framework-Features -IncludeAllSubFeature -Source c:/source/sxs; \
c:/source/setup.exe /configurationfile=c:/source/configurationfile.ini; \
sc.exe config MSSQLSERVER obj=LocalSystem; \
remove-item c:/source -Recurse