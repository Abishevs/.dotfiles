# My dotfiles managed via stow using make

Am using make to be able to stow and unstow specific packages
All the packages are simply enough placed in the packages dir with structure as
it would be expected to be after symlinking them with stow.

## stow all packages
```bash
make stow
```

## stow/unstow specific package
```bash
make stow PKG=<package>
```

```bash
make unstow PKG=<package>
```


Am using arch (pacman and aur helper paru)
So to make it easier to save pacman and aur packges I have make helpers
```bash
make pkg_save
```
This will save pacman and aur packages individually for reproducability on new
machines.

## Quick Installation (broken as I changed the structure)
```bash
curl -sS https://raw.githubusercontent.com/Abishevs/.dotfiles/master/install.sh | bash

```
