# Installing Leapp tool

The Leapp tool is currently installable from rpm packages prepared for [Fedora 26 and 27](#fedora-26-and-27), [CentOS 7](#centos-7) and [RHEL 7](#rhel-7).

If you want to install the Leapp tool on other distribution follow [these](#other-distributions) instructions.

## Fedora 26 and 27

Enable the Leapp Copr repository and install the Leapp tool.

```shell
sudo dnf install -y dnf-plugins-core
sudo dnf copr enable -y @leapp/leapp-devel
sudo dnf install -y leapp
```

## CentOS 7

Add the Leapp Copr repository and EPEL repository (for additional dependencies not installable from default repositories) and install the Leapp tool.

```shell
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/g/leapp/leapp-devel/repo/epel-7/group_leapp-leapp-devel-epel-7.repo
sudo yum install -y epel-release
sudo yum install -y leapp
```

## RHEL 7

Add the Leapp Copr repository and EPEL repository and enable `rhel-7-server-extras-rpms` repository (for additional dependencies not installable from default repositories) and install the Leapp tool.

```shell
sudo curl https://copr.fedorainfracloud.org/coprs/g/leapp/leapp-devel/repo/epel-7/group_leapp-leapp-devel-epel-7.repo -o /etc/yum.repos.d/group_leapp-leapp-devel-epel-7.repo
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo subscription-manager repos --enable=rhel-7-server-extras-rpms
sudo yum install -y leapp
```

## Other distributions

If you are using different distribution and/or you want to build and install Leapp on your own, please see these [instructions](devenv).
