Vim config
========
Tested with Vim 9.1 / MacVim 9.1.

If you have your own .vimrc, .vim, etc.
========

Please backup your configuration.

Attention: this configuration's vimrc file is ~/.vim/vimrc. So if you have ~/.vimrc, please remove/rename it.

After clone:
========
You can move Vim\_config to ~/.vim

```
mv Vim_config ~/.vim
```
or
```
ln -s Vim_config ~/.vim
```

Then run this command:
```
:PlugInstall
```

This repo bundles `autoload/plug.vim`, so `:PlugInstall` is the main setup step after linking `~/.vim`.

Large files use a simplified mode above 10MB. In that mode persistent undo is disabled by default and the statusline shows the current undo-file state.
