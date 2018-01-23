# Setup your Leapp development environment

  Currently, Leapp tool is divided into multiple projects. This means that in order to setup
a development environment one has to setup everything piece by piece. At this point there are
basically two choices, either setup minimal viable environment which includes [*Snactor library*](#snactor),
[*Leapp daemon*](#daemon) and [*Leapp tool*](#leapp) which includes Cockpit UI plugin, or setup
a full fledged development environment which contains all the bits and pieces mentioned in section
[*2*](#repositories). The choice of which kind of environment should be setup depends on the needs.
However, the recommended one is the full fledged environment.
  In order to start the setup procedure, please follow all steps in section [1 - Prerequisites](#prereq)
since every step in the following section [*2*](#repositories) depends on it. Then you can proceed and
set up each required project. This should be again straigtforward process, as it requires following
each step mentioned in the project section.

  Because we realize that this is quite complicated and a rather tedious process, we prepared an
[Ansible playbook](#playbook) and a set of pre-prepared [images](#3-prepared-images-and-ansible-playbook).

## <a name="prereq"></a>1. Prerequisites

#### Step 1) Installing the required tools:

```shell
    sudo dnf -y install git python2-pip
```

#### Step 2) Setting up a project root
```shell
    export LEAPP_HOME=$HOME/leapp
    mkdir -p $LEAPP_HOME
```


## <a name="repositories"></a>2. Leapp repositories

### <a name="snactor"></a>2.1 Snactor library
Snactor library is a runtime dependency of Leapp daemon. This library is responsible for
the execution of so-called actors.

#### Step 1) Repository cloning \*

```shell
    git clone https://github.com/leapp-to/snactor.git $LEAPP_HOME/snactor
    cd $LEAPP_HOME/snactor
```

\* *Fork the repository if you want to open pull requests in the future*

#### Step 2) External dependencies & packages

```shell
    sudo make install-deps
```

#### Step 3) Build & installation:

```shell
    make build
    sudo make install
```

#### Step 4) Setting up a testing environment - unit testing:

*Test execution example:*

```shell
    make test
```

---

### <a name="daemon"></a>2.2 Leapp-daemon
Leapp daemon is writen in golang therefore an working golang environment is
required to build & run it. If you do not have any, please follow these basic steps
in order to setup one.

```shell
    sudo dnf -y install go
    echo "export GOPATH=$HOME/go" >> $HOME/.bashrc
    exec bash
```

#### Step 1) Repository cloning \*

```shell
    go get github.com/leapp-to/leapp-go/...
    ln -s $GOPATH/src/github.com/leapp-to/leapp-go $LEAPP_HOME/leapp-go
    cd $LEAPP_HOME/leapp-go
```

\* *Fork the repository if you want to open pull requests in the future*

#### Step 2) External dependencies & packages

```shell
    sudo dnf -y install golang-googlecode-tools-goimports golint
    make install-deps
```

#### Step 3) Build & installation:

**Requires**
 + [Snactor library](#snactor)

```shell
    make build
    sudo make install
```

#### Step 4) Setting up a testing environment - unit testing:

*Test execution example:*

```shell
    make test
```

---

### <a name="leapp"></a>2.3 Leapp tool

#### Step 1) Repository cloning \*

```shell
    git clone https://github.com/leapp-to/leapp.git $LEAPP_HOME/leapp
    cd $LEAPP_HOME/leapp
```

\* *Fork the repository if you want to open pull requests in the future*

#### Step 2) External dependencies & packages

```shell
    sudo make install-deps
```

#### Step 3) Build & installation:

**Requires**
 + [Snactor library](#snactor)
 + [Leapp daemon](#daemon)

```shell
    make build
    sudo make install
```

#### Step 4) Setting up a testing environment - integration testing:

*Test execution example:*

```shell
    make test
```

---

### 2.4 Leapp control tool (leappctl)
#### Step 1) Repository cloning \*

```shell
    git clone https://github.com/leapp-to/leappctl.git $LEAPP_HOME/leappctl
    cd $LEAPP_HOME/leappctl
```

\* *Fork the repository if you want to open pull requests in the future*

#### Step 2) Build & installation

**Requires**
 + [Leapp daemon](#deamon)

```shell
    sudo make install
```

#### Step 3) Setting up a testing environment - unit testing

*Test execution example:*

```shell
    make test
```

---

### 2.5 Leapp actor repository
#### Step 1) Repository cloning \*

```shell
    git clone https://github.com/leapp-to/leapp-actors.git $LEAPP_HOME/leapp-actors
    cd $LEAPP_HOME/leapp-actors
```

\* *Fork the repository if you want to open pull requests in the future*

#### Step 2) External dependencies & packages

```shell
    sudo make install-deps
```

#### Step 3) Build & installation:

```shell
    make build
    sudo make install
```

#### Step 4) Setting up a testing environment - actor testing

**Requires:**
 + [Snactor library](#snactor)

*Test execution example:*

```shell
    make test
```

## 3. Prepared images and Ansible playbook

### <a name="vagrant"></a>3.1 Vagrant

  Please download [Vagrantfile](https://raw.githubusercontent.com/leapp-to/leapp/master/dev-images/vagrant/Vagrantfile) from the leapp
repository. Then you can start your new instance of leapp development environment using following command executed
from the folder where the Vagrant file was downloaded:

```shell
    vagrant up
```

### 3.2 Docker
  Please download [Dockerfile](https://raw.githubusercontent.com/leapp-to/leapp/master/dev-images/docker/Dockerfile) from the leapp
repository. Once the file is downloaded, you can proceed with steps in section 3.2.1.

#### 3.2.1 Creating the container

  From the folder where the Dockerfile is located, run:

*Build the docker image and run it*

```shell
    docker build -t leapp-devenv .
    docker run --name leapp-devenv-instance -i -d -e container=docker \
        --tmpfs /tmp --tmpfs /run -v /sys/fs/cgroup/:/sys/fs/cgroup/:ro --privileged leapp-devenv
```

*Connect to the docker container*

```shell
    docker exec -ti leapp-devenv-instance /bin/bash -c "cd /root && exec \$SHELL"
```

*Watch the provisioning progress*

  The installation / provisioning process is being executed during the first start of the container.
This is time consuming process and you can watch the progress using:

```shell
    watch tail -n 30 /root/leapp-setup.log
```

*How to recognize the installation is done*

  If there was no error during the setup process, you should see following message at the end of the logs:

```
    Please run:

            exec /bin/bash

            or logout & login to finish the setup.

    Provisioning of development environment was completed
```

#### 3.2.2 Restarting the container

  The docker container is by design ephemeral. However, if you want to keep the changes and possibly return
to your work after you exited the container, you can restart it and reconnect to it using these commands:

```shell
    docker start leapp-devenv-instance
    docker exec -ti leapp-devenv-instance /bin/bash -c "cd /root && exec \$SHELL"
```

#### 3.2.3 Removing the container

  If you are done with your environment, you can simply remove the container by using this command:

```shell
    docker rm -f leapp-devenv-instance
```

### <a name="playbook"></a>3.3 Ansible playbook

*Install Git nad Ansible*

```shell
    sudo dnf install -y git ansible
```

*Clone the repository with Ansible playbook*

```shell
    git clone https://github.com/leapp-to/ansible-devel-env.git
```

*Run the playbook*

```shell
    cd ansible-devel-env/ansible
    ansible-playbook leapp_dev.yml -K
```

***NOTE***: Please be aware that you will need sudo privileges and the playbook
may alter your $HOME/.\*rc file
