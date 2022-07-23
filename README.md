# Fedora
Minimal install script.  Having installed a minimal Fedora installation you will, in the command line need to first install git:
~~~
$ sudo dnf install git
$ git clone https://github.com/dajhub/fedora
$ cd fedora
$ sudo ./install.sh
~~~

### Additional installations
Depends on whether these are wanted beyond the initial install script.  Links for installation:
- Font manager / viewer: https://github.com/FontManager/font-manager
- Visual Studio Code: https://code.visualstudio.com/docs/setup/linux
- QEMU/KVM - virtual machine: https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/ 
  - To use the VM without entering the root password we need to configure KVM to enable it.  See #4 on the attached link: https://discovery.endeavouros.com/applications/how-to-install-virt-manager-complete-edition/2021/09/

### Everblush
Theme used is based on [Everblush](https://github.com/Everblush)