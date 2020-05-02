# Run Ross Timson

![Deploy](https://github.com/rosstimson/run-rosstimson/workflows/Deploy/badge.svg)

Scripts to provision my laptops / desktops.

## Usage

### Prepare

The script needs access to some private repos and therefore my SSH
keys need putting on the new machine before running the `post-install`
script.

    mkdir -p /home/rosstimson/.ssh
    && chmod 400 /home/rosstimson/.ssh

    <COPY PRIVATE KEYS FROM USB>

### Ubuntu

    sudo su -
    wget -qO- https://ross.run/ubuntu/install | sh


### Wallpaper Credit

[Unsplash: Denys Nevozhai - Tokyo Night]( https://unsplash.com/@dnevozhai "Unsplash.com | Denys Nevozhai")
