default:
	puppet-lint -f manifests/ --no-autoloader_layout-check
	puppet module build

clean:
	rm -rf pkg

install:
	rm -rf /etc/puppet/modules/commonlinuxstuff
	tar xavf pkg/*.tar.gz  -C /etc/puppet/modules/
	mv -f /etc/puppet/modules/jamesread-commonlinuxstuff* /etc/puppet/modules/commonlinuxstuff
