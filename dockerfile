# Install MSSQL

# Specifying Container Image
FROM microsoft/windowsservercore

#Copy DOTNET Files
ADD ./source c:/source

# Install DOTNET

RUN powershell.exe -command \

install-windowsfeature -name NET-Framework-Features -IncludeAllSubFeature -Source c:/source/sxs; \
c:/source/setup.exe /configurationfile=c:/source/configurationfile.ini; \
sc.exe config MSSQLSERVER obj=LocalSystem; \
remove-item c:/source -Recurse