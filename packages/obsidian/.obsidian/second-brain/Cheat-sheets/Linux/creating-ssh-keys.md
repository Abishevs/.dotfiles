## Recreate an public key with private key
Copy your private key into id_rsa then run that, copy the key below add
````Bash
$ ssh-keygen -f id_rsa -y
ssh-rsa AAAA...
``````
## Fixing permmision aka the error bellow
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0744 for '~/.ssh/id_rsa' are too open.
It is recommended that your private key files are NOT accessible by others.
This private key will be ignored.
bad permissions: ignore key: ~/.ssh/id_rsa
```Bash
$ sudo chmod 600 ~/.ssh/id_rsa
$ sudo chmod 600 ~/.ssh/id_rsa.pub 
```
### if this error 
Are you sure you want to continue connecting (yes/no)? yes
Failed to add the host to the list of known hosts (~/.ssh/known_hosts).

Then run this 
```Bash
sudo chmod 644 ~/.ssh/known_hosts
`````

### You may need to adjust the directory permissions as well
````Bash
sudo chmod 755 ~/.ssh
``````
