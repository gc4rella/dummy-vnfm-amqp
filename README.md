  <img src="https://raw.githubusercontent.com/openbaton/openbaton.github.io/master/images/openBaton.png" width="250"/>
  
  Copyright © 2015-2016 [Open Baton](http://openbaton.org). 
  Licensed under [Apache v2 License](http://www.apache.org/licenses/LICENSE-2.0).

# Dummy VNFManager Amqp
The Dummy-VNFManager-Amqp imitates the behaviour of a real VNFManager. For the communication with the NFVO it uses AMQP.  
If you use the Dummy-VNFManager-Amqp for deploying a network service it will not create any resources. 
When the NFVO sends commands to the Dummy-VNFManager-Amqp, it will answer as if it executed them although it actually did not. 
In this way Openbaton can be tested without actually deploying anything. 

# Technical Requirements
A running NFVO.  
The NFVO has to contain the test-plugin in the folder **plugins/vim-drivers**, this will probably already be in place. 


# How to install the Dummy VNFManager Amqp

Git clone the project and change into it's root directory. 
Execute *./dummy-vnfm.sh compile* to compile it. 

# How to use the Dummy VNFManager Amqp

To start the Dummy-VNFM-Amqp execute *./dummy-vnfm.sh start* in the project's root directory.  
This will create a new screen window which you can access using *screen -x openbaton*.  
If you want to run the Dummy VNFManager Amqp on another machine than on which rabbitmq is running you first have to configure it.  
You can either change the property *spring.rabbitmq.host* to the ip address of the host running rabbitmq in the *application.properties* file 
in the project's resources folder or you can create a properties file */etc/openbaton/dummy-vnfm-amqp.properties*, copy the previously mentioned 
*application.properties* file's content into it and change the ip address there.  
If you decided to create the file */etc/openbaton/dummy-vnfm-amqp.properties* the Dummy VNFManager Amqp will only use this one so make sure 
that all the properties from the file *application.properties* are present.  
To use the Dummy-VNFManager-Amqp for "deploying" a network service you have to store a VimInstance with type *test* in the NFVO 
and the Virtual Network Function Descriptors used to describe the network service have to define their *endpoint* as *test*. 

# How to extend the Dummy VNFManager Amqp

If you want the Dummy VNFManager Amqp to behave differently you can change it's behaviour in the DummyAMQPVNFManager.java class.
In this class all the methods are defined that will be executed by a VNFM while deploying a network service. 

# Issue tracker

Issues and bug reports should be posted to the GitHub Issue Tracker of this project

# What is Open Baton?

OpenBaton is an open source project providing a comprehensive implementation of the ETSI Management and Orchestration (MANO) specification.

Open Baton is a ETSI NFV MANO compliant framework. Open Baton was part of the OpenSDNCore (www.opensdncore.org) project started almost three years ago by Fraunhofer FOKUS with the objective of providing a compliant implementation of the ETSI NFV specification. 

Open Baton is easily extensible. It integrates with OpenStack, and provides a plugin mechanism for supporting additional VIM types. It supports Network Service management either using a generic VNFM or interoperating with VNF-specific VNFM. It uses different mechanisms (REST or PUB/SUB) for interoperating with the VNFMs. It integrates with additional components for the runtime management of a Network Service. For instance, it provides autoscaling and fault management based on monitoring information coming from the the monitoring system available at the NFVI level.

# Source Code and documentation

The Source Code of the other Open Baton projects can be found [here][openbaton-github] and the documentation can be found [here][openbaton-doc] .

# News and Website

Check the [Open Baton Website][openbaton]
Follow us on Twitter @[openbaton][openbaton-twitter].

# Licensing and distribution
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# Support
The Open Baton project provides community support through the Open Baton Public Mailing List and through StackOverflow using the tags openbaton.


[openbaton]: http://openbaton.org
[openbaton-doc]: http://openbaton.org/documentation
[openbaton-github]: http://github.org/openbaton
[openbaton-logo]: https://raw.githubusercontent.com/openbaton/openbaton.github.io/master/images/openBaton.png
[openbaton-mail]: mailto:users@openbaton.org
[openbaton-twitter]: https://twitter.com/openbaton