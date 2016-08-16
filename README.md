jamesread-commonlinuxstuff
=================

A puppet module containing my commonly used stuff.

To install the latest release that is published on puppet forge;

	puppet module install jamesread-commonlinuxstuff

Alternatively, view this project on puppet forge at the following URL: https://forge.puppetlabs.com/jamesread/commonlinuxstuff/scores

Using the module without a puppet master
---

This is what I do to use the module without a puppet master;

	user@host: echo "include commonlinuxstuff::basics" >> /etc/puppet/local.pp
	...

	user@host: puppet apply /etc/puppet/local.pp

