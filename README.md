# mvb [![Releases](https://img.shields.io/github/release/andreiborisov/mvb.svg?label=&color=0080FF)](https://github.com/andreiborisov/mvb/releases/latest)

mvb (macOS Vagrant boxes) is a toolchain for the creation and publishing of macOS Vagrant base boxes for the [Parallels provider](https://github.com/Parallels/vagrant-parallels). No changes made to the boxes beyond those performed by [macinbox](https://github.com/bacongravy/macinbox).

*Use only in accordance with the [Apple SLAs](https://www.apple.com/legal/sla/).*

## Box usage

Boxes are built according to macOS minimal system requirements.

Username and password are set to Vagrant recommended defaults:

* username: `vagrant`
* password: `vagrant`

To access the VM using SSH run:

```shell
vagrant ssh
```

To access guest macOS GUI just open Parallels Desktop and you should see your running Vagrant machine in the VM list.

### [macOS Catalina (10.15)](https://app.vagrantup.com/andreiborisov/boxes/macos-catalina)

Defaults for macOS Catalina are:

* 4 GB of memory
* 2 CPUs
* 64 GB dynamically-allocated disk
* 256 MB of GPU memory
* APFS (Apple File System)

You can download the box and add it to your project with:

```shell
vagrant box add andreiborisov/macos-catalina
vagrant init andreiborisov/macos-catalina
```

## Installation

### System requirements

Install the dependencies with [Homebrew](https://brew.sh) (recommended):

```shell
curl https://raw.githubusercontent.com/andreiborisov/mvb/main/Brewfile -so Brewfile
brew bundle
rm -f Brewfile Brewfile.lock.json
brew gem install macinbox
vagrant plugin install vagrant-parallels
```

<details>
<summary>Not using Homebrew?</summary>

- - -

mvb requires:

* [fish](https://fishshell.com) 3.1+
* [macinbox](https://github.com/bacongravy/macinbox) 4+
* [Parallels Desktop Pro Edition](https://www.parallels.com/products/desktop) 15.1.3+
* [Parallels Desktop Vagrant Provider](https://github.com/Parallels/vagrant-parallels) 2+
* [Vagrant](https://www.vagrantup.com) 2.2.5+

</details>

### For fish

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher add andreiborisov/mvb
```

### For other shells

Install manually by downloading a standalone executable script from the [latest release](https://github.com/andreiborisov/mvb/releases/latest).

## Usage

To create a base box yourself you'll need to download a macOS installer from Mac App Store first. After that is done use `mvb create` subcommand:

```fish
mvb create 10.15.4 '/Applications/Install macOS Catalina.app'
```

This will create a macOS `10.15.4` base box from the installer `/Applications/Install macOS Catalina.app`.

If you wish to upload the base box to Vagrant Cloud, you'll need to package it first with `mvb package` subcommand:

```fish
mvb package 10.15.4 catalina.box
```

This will package locally installed macOS `10.15.4` box into a file `catalina.box`.

You can upload the packaged box to Vagrant Cloud using `mvb publish` subcommand:

```
mvb publish andreiborisov/macos-catalina 1.0.0 'Initial release' catalina.box
```

This will create a version `1.0.0` in `andreiborisov/macos-catalina` repo on Vagrant Cloud with a changelog `Initial release` and upload `catalina.box` as a parallels provider for this version.

To see the full usage of a particular subcommand run it with `--help` flag:

```fish
mvb create --help
```

## License

[MIT](LICENSE)
