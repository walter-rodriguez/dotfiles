# Mis archivos de configuración (dotfiles)

*Basados en el post [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)*

Esta Configuración se basa en el método de usar un repositorio **Bare** ([Mayor Info](https://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/))
la cual evita usar herramientas de terceros (GNU Stow, Chezmoi, Dotbot, Homesick, ...) para utilizar solamente Git y una
configuración en el archivo `.bashrc` o `.zshrc` (dependiendo del shell que utilicen).

La técnica consiste en almacenar un repositorio básico de Git en una carpeta "lateral" (*Bare*, como `$HOME/.dotfiles`)
utilizando un alias especialmente diseñado para que los comandos se ejecuten en ese repositorio y no en
la carpeta local `.git` habitual, lo que interferiría con cualquier otro repositorio de Git.

Para clonar este proyecto se deben ejecutar los siguientes comandos:

> Para este ejemplo se utiliza el Shell ZSH, acomodar al shell correspondiente

```bash
git clone --bare https://github.com/walter-rodriguez/dotfiles.git $HOME/.dotfiles
# Validar la ruta de git
BIN_GIT=$(which git)
alias dotfiles='$BIN_GIT --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
# Cambiar a archivo de configuración de la shell utilizada
echo 'BIN_GIT=$(which git)' >> $HOME/.zshrc
echo 'alias dotfiles="$BIN_GIT --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.zshrc
```

Si al ejecutar el comando `dotfiles checkout` arroja un mensaje parecido a:

```
error: The following untracked working tree files would be overwritten by checkout:
    .zshrc
    .gitignore
    (...)
Please move or remove them before you can switch branches.
Aborting
```

Esto se debe a que es posible que su carpeta `$HOME` ya tenga algunos archivos de configuración que este repositorio
sobreescribiría, puede decidir respaldarlos o simplemente eliminarlos. Para respaldarlos ejecute lo siguiente:

```bash
mkdir -p .config-backup && dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
# Cambiar a archivo de configuración de la shell utilizada
echo 'BIN_GIT=$(which git)' >> $HOME/.zshrc
echo 'alias dotfiles="$BIN_GIT --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.zshrc
```

Para más información, puede seguirla del enlace publicado al comienzo de este documento.
