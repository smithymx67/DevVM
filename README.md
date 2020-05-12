# Ubuntu/eoan64 - Web

## Setup
Please install these plugin<br>
* `vagrant plugin install vagrant-vbguest`
* `vagrant plugin install vagrant-disksize`

---

## Commands
Run `vagrant up` to start  
Run `vagrant ssh` to connect  
Run `vagrant halt` to shutdown  
Run `vagrant destroy` to delete

---

## Secure the database
You can run `mysql_secure_installation` to secure the mysql database

---

## Access the datbase console
You can access the database using `mariadb` or `mysql`

---

## Public Access
Uncomment `config.vm.network "public_network"`  
Then select the interface to bridge when asked

---

## Composer and Node
Composer can be used with the command `composer`  
Node and NPM is also installed, `node` and `npm`

---

## Updating vbguest Plugin
To update the vbguest plugin, run:  
`vagrant plugin update vagrant-vbguest`

---

## Fixing vbguest Plugin
To repair the vbguest plugin, run:  
`vagrant plugin repair vagrant-vbguest`