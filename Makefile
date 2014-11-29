defualt:
	puppet module build

install:
	rm -rf /etc/puppet/modules/jwr-puppet-module*
	tar xavf pkg/*.tar.gz  -C /etc/puppet/modules/
	mv /etc/puppet/modules/jwr-puppet-module{*,}
