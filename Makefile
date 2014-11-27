defualt:
	puppet module build

install:
	tar xavf pkg/*.tar.gz  -C /etc/puppet/modules/
	mv /etc/puppet/modules/jwr-puppet-module{*,}
