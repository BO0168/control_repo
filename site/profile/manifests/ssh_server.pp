class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDGHmZKzIJ6lCGGZkZRdPQ/95r7QW5rKIpUMNmPDopZ2VixCCtgjnqHiOf4Zuf1nDv1bNCLfywp0NuBgFIfRSIVCwYWVNTJ8iWeVPMc6bt46UVNIAp4eXQR9bIDwVoL/kltrz05+SQXZTG/7XRYkcgQ1DDN9Oh7FyVi1OAfPAVlYwJNoUZPLKNqZf4hHf87hObDTQ+MMeo5WUYP49XCw2/pKj9hbvxgdpllEepM53EQwwkAiKeoKQOZvhZjlYTJbThxpyTr/MHtMAqaxYwm8BYFzWO1KXMawLHXgNvOAfefEd/p2O67P7DZLJmteG13ihQiofRVYyyRfswOMB7c8rxB',
	}  
}
