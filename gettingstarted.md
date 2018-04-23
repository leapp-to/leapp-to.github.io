# Installing Leapp 

Leapp is currently installable from rpm packages prepared for [Fedora](#fedora) 26, 27 and 28, [CentOS 7](#centos-7) and [RHEL 7](#rhel-7).

If you are using different distribution and/or you want to build and install Leapp on your own, follow these [instructions](/devenv)

## Fedora

Enable the Leapp Copr repository and install Leapp.

```shell
sudo dnf install -y dnf-plugins-core
sudo dnf copr enable -y @leapp/leapp-devel
sudo dnf install -y leapp
```

## CentOS 7

Add the Leapp Copr repository and EPEL repository (for additional dependencies not installable from default repositories) and install Leapp.

```shell
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/g/leapp/leapp-devel/repo/epel-7/group_leapp-leapp-devel-epel-7.repo
sudo yum install -y epel-release
sudo yum install -y leapp
```

## RHEL 7

Add the Leapp Copr repository and EPEL repository and enable `rhel-7-server-extras-rpms` repository (for additional dependencies not installable from default repositories) and install Leapp.

```shell
sudo curl https://copr.fedorainfracloud.org/coprs/g/leapp/leapp-devel/repo/epel-7/group_leapp-leapp-devel-epel-7.repo -o /etc/yum.repos.d/group_leapp-leapp-devel-epel-7.repo
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo subscription-manager repos --enable=rhel-7-server-extras-rpms
sudo yum install -y leapp
```

# The leapp tool

The `leapp` tool is the end user application designed to run specific workflows. If you'd like to run custom workflows and/or create actors, use `snactor`. To learn how to create your own actors and workflows, see the [tutorial](http://leapp.readthedocs.io/en/latest/tutorials.html).

We are currently providing workflow for upgrading system that can be run using following command:

```shell
leapp upgrade
```

Some phases of upgrade workflow will reboot the system and you will need to resume leapp.

```shell
leapp upgrade --resume
```


For more information about Leapp, check the [documentation](http://leapp.readthedocs.io/en/latest/index.html)

