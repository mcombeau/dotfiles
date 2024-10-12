# dotfiles

This is an automated setup for Debian/Ubuntu based machines. It installs preconfigured binaries and sets up configuration files.

Setup in one command (no prerequisites):

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply mcombeau
```

The dotfiles in this repo are managed using [Chezmoi](https://www.chezmoi.io/) and package install is handled with [Ansible](https://www.ansible.com/) (which is also automatically installed with the above command).
