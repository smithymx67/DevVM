# DevVM - Docs

## Setup

Install Vagrant - <https://www.vagrantup.com/>  
Please install these plugin

* `vagrant plugin install vagrant-vbguest`
* `vagrant plugin install vagrant-disksize`

---

## Commands

Run `vagrant up` to start  
Run `vagrant ssh` to connect  
Run `vagrant halt` to shutdown  
Run `vagrant destroy` to delete

---

## Database

The database has the following login details: `root:root`  
From the console use `mysql -uroot -proot`  
phpMyAdmin had also been added for easy use <https://astroid/phpMyAdmin>

---

## Apache and PHP

Apache 2.4 and PHP 7.4 have been installed  
You can access the server at <https://192.168.56.101> or <https://astroid>  
HTTP and HTTPS are enabled  
Google Chrome may moan about HTTPS, if so type `thisisunsafe` and it will let you in

---

## Composer and Node

Composer can be used with the command `composer`  
Node and NPM is also installed, `node` and `npm`  
Note: I recommend using `composer` and `node`/`npm` on the host for project related things

---

## Updating vbguest Plugin

To update the vbguest plugin, run:  
`vagrant plugin update vagrant-vbguest`

---

## Fixing vbguest Plugin

To repair the vbguest plugin, run:  
`vagrant plugin repair vagrant-vbguest`
