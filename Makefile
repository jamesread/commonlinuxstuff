default:
	puppet module build

clean:
	rm -rf pkg

install:
	rm -rf /etc/puppet/modules/jwrpuppetmodule
	tar xavf pkg/*.tar.gz  -C /etc/puppet/modules/
	mv -f /etc/puppet/modules/jwr-jwrpuppetmodule* /etc/puppet/modules/jwrpuppetmodule
	
