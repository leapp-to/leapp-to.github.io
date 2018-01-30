# Installing Leapp tool

## Fedora 26 and 27

	```shell
	sudo dnf install dnf-plugins-core -y
	sudo dnf copr enable @leapp/leapp-devel -y
	sudo dnf install leapp -y
	```

## CentOS 7

	```shell
	sudo yum install yum-utils -y
	sudo yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/g/leapp/leapp-devel/repo/epel-7/group_leapp-leapp-devel-epel-7.repo
	sudo yum install epel-release -y
	sudo yum install leapp -y
	```

## RHEL 7

	```shell
	sudo curl https://copr.fedorainfracloud.org/coprs/g/leapp/leapp-devel/repo/epel-7/group_leapp-leapp-devel-epel-7.repo -o /etc/yum.repos.d/group_leapp-leapp-devel-epel-7.repo
	sudo yum install http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm -y
	sudo subscription-manager --enable rhel-7-server-extras-rpms
	sudo yum install leapp -y
	```

## Other distributions

If you are using different distribution and/or you want to build and install Leapp on your own, please see these [instructions](devenv).
