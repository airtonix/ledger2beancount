# Installation

ledger2beancount is a Perl script and relies on the following modules:

* `Date::Calc`
* `DateTime::Format::Strptime`
* `enum`
* `File::BaseDir`
* `Getopt::Long::Descriptive`
* `List::MoreUtils`
* `Regexp::Common`
* `String::Interpolate`
* `YAML::XS`

You can install the required Perl modules with
[cpanminus](https://metacpan.org/pod/distribution/App-cpanminus/bin/cpanm):

```shell
cpanm --installdeps .
```

If you use Debian, you can install the dependencies with this command:

```shell
sudo apt install libdate-calc-perl libdatetime-format-strptime-perl \
    libenum-perl libfile-basedir-perl libgetopt-long-descriptive-perl \
    liblist-moreutils-perl libregexp-common-perl \
    libstring-interpolate-perl libyaml-libyaml-perl
```

ledger2beancount itself consists of one script.  You can clone the
repository and run the script directly or copy it to `$HOME/bin` or
a similar location:

```shell
git clone https://github.com/beancount/ledger2beancount/
cd ledger2beancount
./bin/ledger2beancount examples/simple.ledger
```

## Arch Linux

ledger2beancount is available on [AUR](https://aur.archlinux.org/packages/ledger2beancount/).

## Debian

ledger2beancount is [available in Debian](https://packages.debian.org/ledger2beancount).

## Docker

You can create a Docker image for ledger2beancount using the `Dockerfile`
that's part of ledger2beancount's Git repository:

```shell
git clone https://github.com/beancount/ledger2beancount/
cd ledger2beancount
export $IMAGE_NAME=ledger2beancount
DOCKER_BUILDKIT=1 docker image build -t $IMAGE_NAME .
```

> [!WARNING]
> Building the Docker image is only supported within Linux environments.
> For windows users, this means you should be using Windows Subsystem for Linux or a Linux Virtual Machine.
> For macOS users, this means you should be using a Linux Virtual Machine.

Now you can run ledger2beancount like this:

```shell
docker run --rm --it -v "$(pwd):/data:rw" $IMAGE_NAME -c /data/test/accounts.yaml /data/test/accounts.ledger
```

## macOS

You can install Perl and `cpanm` from Homebrew:

```shell
brew install perl
brew install cpanminus
```

## Microsoft Windows

You can install [Strawberry Perl](http://strawberryperl.com/) on Windows
and use `cpanm` as described above to install the required Perl modules.
ledger2beancount is not packaged for Windows but you can clone this Git
repository and run the script.

## pkgsrc

ledger2beancount is [available for pkgsrc](https://pkgsrc.se/finance/ledger2beancount)
which is used on NetBSD and other operating systems.

## Ubuntu

ledger2beancount is [available in Ubuntu](https://packages.ubuntu.com/ledger2beancount).

