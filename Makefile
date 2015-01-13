default:
	puppet module build

clean:
	rm -rf pkg

install:
	sudo mkdir -p /etc/puppet/modules/jwr-jwrpuppetmodule
	sudo tar xavf pkg/*.tar.gz  -C /etc/puppet/modules/jwr-jwrpuppetmodule
	
