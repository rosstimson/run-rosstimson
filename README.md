# Run Ross Timson

![Deploy](https://github.com/rosstimson/run-rosstimson/workflows/Deploy/badge.svg)

Scripts to provision my laptops / desktops.

## Usage

### Prepare

The script needs access to some private repos and therefore my SSH
keys need putting on the new machine before running the `post-install`
script.

    mkdir -p /home/rosstimson/.ssh \
    && chmod 700 /home/rosstimson/.ssh

    <COPY PRIVATE KEYS FROM USB INTO DIR>

Remember to also copy across secret Signify key to
`~/.signify/rosstimson.sec` for signing new versions of these scripts.

### macOS

There are a few things that needs done manually after running the
install script.

1. Disable ctrl-space keyboard shortcut: Sys Prefs -> Keyboard
   shortcuts -> Keyboard Shortcuts -> Input sources

2. Install Cartograph font as Emacs config defaults to it.

### Ubuntu

Get the install script:

    sudo su -
    wget https://ross.run/ubuntu/install

*Optional*: Grab the signify public key to verify the install scripts integrity:

    apt update
    apt install -y signify-openbsd

    wget https://ross.run/rosstimson.pub
    wget https://ross.run/ubuntu/SHA256
    wget https://ross.run/ubuntu/SHA256.sig

    signify-openbsd -V -p rosstimson.pub -m SHA256
    Signature Verified

    sha256sum -c SHA256
    install: OK

Run the script:

    chmod +x install
    ./install

## Signing Scripts

Assuming the secret `signify` key exists at:
`~/.signify/rosstimson.sec` new versions of the install scripts can
have a signed checksum file generated to verify the script has not
been tampered with at a later date by doing:

    sha256sum install > SHA256
    signify -S -s ~/.signify/rosstimson.sec -m SHA256 -x SHA256.sig

### Wallpaper Credit

[Unsplash: Denys Nevozhai - Tokyo Night]( https://unsplash.com/@dnevozhai "Unsplash.com | Denys Nevozhai")
