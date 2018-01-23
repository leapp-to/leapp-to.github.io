# Installing Leapp tool

* Prerequisites
    * Enable copr repository
        ```shell
        sudo dnf install dnf-plugins-core -y
        sudo dnf copr enable evilissimo/leapp-stable -y
        ```
    * Install required tools
        ```shell
        sudo dnf install git go -y
        ```

* [leapp-tool](https://github.com/leapp-to/leapp)

    Basis of leapp tool

    ```shell
    sudo dnf install leapp-tool -y
    ```
    This will install following packages:
    * leapp-tool
    * leapp-actor-tools
    * python-snactor
    * python2-leapp

* [leapp-cockpit](https://github.com/leapp-to/leapp)

    Cockpit UI plugin

    ```shell
    sudo dnf install leapp-cockpit -y
    ```
    This will install following packages:
    * leapp-cockpit

* [leapp-actors](https://github.com/leapp-to/leapp-actors)

    Leapp actors library

    ```shell
    git clone https://github.com/leapp-to/leapp-actors
    cd leapp-actors
    sudo make install
    ```

    **TODO**: This installs only dependencies, but not the actors thmeselves.

* [leappctl](https://github.com/leapp-to/leappctl)

	Leapp control tool

    ```shell
    git clone https://github.com/leapp-to/leappctl
    cd leappctl
    sudo make install
    ```

* [leapp-go](https://github.com/leapp-to/leapp-go)

	Leapp daemon

    ```shell
    go get github.com/leapp-to/leapp-go/cmd/leapp-daemon
    sudo cp $(go env GOPATH)/bin/leapp-daemon /usr/bin/leapp-daemon
    ```

* [actor-browser](https://github.com/leapp-to/actor-browser)

	**TODO**

* [actor-sdk](https://github.com/leapp-to/actor-sdk)

	**TODO**
