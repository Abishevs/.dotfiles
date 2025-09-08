## How to backup an WSL distro

### step 1. 
Powershell command to print currently installed distros

```Powershell
wsl -l -v 

```
With that info use name as distro name in next step. 
> **OBS**
> It's important to have the exact name of the distro

### step 2
```Powershell
wsl --export distro backup_file_name.tar

```
saves by default in the dir from which you're running command.


## How to import or restore

### Step 1. 
Be sure there is no Distro with the same name as your backup
Delete such via  'add remove programs'

### step 2.

```Powershell
wsl --import distro install\path\ file\location\backup_file_name.tar

```
default install path is: C:\wsl

