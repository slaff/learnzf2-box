Isolated development environment for programming with Zend Framework 2(ZF2).
Designed especially for the "Learn ZF2" book (http://learnzf2.com) but can be used also for other ZF2 projects.

Prerequisites
=============
You need to have the latest versions of [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed and configured.

Usage
====
To create or power the dev box run:

`vagrant up`

This will create a new virtual machine that is run by VirtualBox. This is your new dev box.

To enter the dev box run

`vagrant ssh`

Source Code
===========
The source code is in a shared folder named `dev` and can be accessed and modified both from inside the virtual machine and from your physical machine.
Inside the virtual machine the code is located under ~/dev/learnzf2. Outside the virtual machine the code is in a sub-folder called `dev`, which is one level below the folder where the `Vagrantfile` is located. 

Web Access
==========
In order to access the virtual machine web server from the host machine you have to type

http://localhost:8080/

That should lead you to the example ZF2 application.

For more information about available users take a look at [the Learn ZF2 code repository](https://github.com/slaff/learnzf2#application-users).


PHP7
====
The upcoming PHP7 looks quite promising and if you want to test your Zend Framework 2 application with it you should create a new virtual machine using the following commands:

(Optional). If you want to run on a clean box it is highly recommended to run this command. 
It destroys your existing dev box but the source code stored under the `dev` folder and any changes to it are kept.

`vagrant destroy`

To create or power the dev box with PHP7 run:

`PHP=7 vagrant up`

Since PHP7 is still under heavy development you may want to have the latest updates.
To get them run the following command:

`PHP=7 vagrant provision`

To enter the dev box run

`vagrant ssh`
