default:
	puppet-lint -f commonlinuxstuff/
	puppet module build

clean:
	rm -rf pkg

install:
	rm -rf /etc/puppet/modules/commonlinuxstuff
	tar xavf pkg/*.tar.gz  -C /etc/puppet/modules/
	mv -f /etc/puppet/modules/jamesread-commonlinuxstuff* /etc/puppet/modules/commonlinuxstuff
