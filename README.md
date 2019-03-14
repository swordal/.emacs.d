# Based on [purcell/emacs.d](https://github.com/purcell/emacs.d)

Fro newbies in Emacs, there would be some lessons when use Purcell's .emacs.d configuration: Never try to edit directly Purcell's configuration, there are two ways to change settings:

* Press f10 to open the menu, then just change settings in the graphic interface.
* Try your own lisp code in this way:
1. make a file named init-local.el in the folder ~/.emacs.d/init/,
```
your lisp code here.
--------
(provide 'init-local.el)

```
2. add a line in ~/.emacs.d/init.el

> require 'init-local
