Isolated development environment for programming with Zend Framework 2(ZF2).
Designed especially for the "Learn ZF2" book (http://learnzf2.com) but can be used also for other ZF2 projects.

You need to have the latest versions of Vagrant and VirtualBox installed and configured.
To create or power the dev box run:

`vagrant up`

To enter the virtual machine run

`vagrant ssh`

The programming code is located under ~/dev/learnzf2.

In order to access the virtual machine web server from the host machine you have to type

http://localhost:8080/

That should lead you to the example ZF2 application.

For more information about available users take a look at [the Learn ZF2 code repository](https://github.com/slaff/learnzf2#application-users).
