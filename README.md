# macos-vagrant

This is an issue repo for macOS Vagrant base boxes for the [Parallels provider](https://github.com/Parallels/vagrant-parallels) published at [Vagrant Cloud](https://app.vagrantup.com/andreiborisov).

## Usage

Boxes are built according to macOS minimal system requirements.

Username and password are set to Vagrant recommended defaults:

* username: `vagrant`
* password: `vagrant`

To access the VM using SSH run:

```shell
vagrant ssh
```

To access guest macOS GUI just open Parallels Desktop and you should see your running Vagrant machine in the VM list.

### [macOS Big Sur (11.0) – Intel](https://app.vagrantup.com/andreiborisov/boxes/macos-bigsur-intel)

Defaults for macOS Big Sur are:

* 4 GB of memory
* 2 CPUs
* 256 GB dynamically-allocated disk

You can download the box and add it to your project with:

```shell
vagrant box add andreiborisov/macos-bigsur-intel
vagrant init andreiborisov/macos-bigsur-intel
```

### [macOS Catalina (10.15)](https://app.vagrantup.com/andreiborisov/boxes/macos-catalina)

Defaults for macOS Catalina are:

* 4 GB of memory
* 2 CPUs
* 64 GB dynamically-allocated disk

You can download the box and add it to your project with:

```shell
vagrant box add andreiborisov/macos-catalina
vagrant init andreiborisov/macos-catalina
```

## What's included?

Starting macOS Big Sur boxes include:
* Xcode Command Line Tools
* [Homebrew](https://brew.sh)

No changes have been made to macOS aside from installing these components.

## License

[Apple SLAs](https://www.apple.com/legal/sla/)
