;;; magik-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "magik-aliases" "magik-aliases.el" (0 0 0 0))
;;; Generated autoloads from magik-aliases.el

(autoload 'magik-aliases-mode "magik-aliases" "\
Major mode for editing Magik aliases files.

You can customise magik-aliases-mode with the magik-aliases-mode-hook.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-aliases" '("magik-aliases-")))

;;;***

;;;### (autoloads nil "magik-cb" "magik-cb.el" (0 0 0 0))
;;; Generated autoloads from magik-cb.el

(autoload 'magik-cb "magik-cb" "\
Start or resume a Smallworld Class Browser.

With a prefix arg, ask user for GIS buffer to associate with.

Main top level entry to the cb.

Create the buffer and/or start the process if necessary.
Do a no-op if already in the cb.

\(fn &optional GIS METHOD CLASS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-cb" '("magik-cb")))

;;;***

;;;### (autoloads nil "magik-electric" "magik-electric.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from magik-electric.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-electric" '("magik-")))

;;;***

;;;### (autoloads nil "magik-indent" "magik-indent.el" (0 0 0 0))
;;; Generated autoloads from magik-indent.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-indent" '("magik-")))

;;;***

;;;### (autoloads nil "magik-keys" "magik-keys.el" (0 0 0 0))
;;; Generated autoloads from magik-keys.el

(autoload 'magik-global-bindings "magik-keys" "\
Setup the default Smallworld key bindings.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-keys" '("magik-customize")))

;;;***

;;;### (autoloads nil "magik-loadlist" "magik-loadlist.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from magik-loadlist.el

(autoload 'magik-loadlist-mode "magik-loadlist" "\
Major mode for editing Magik load_list.txt files.

You can customise magik-loadlist-mode with the magik-loadlist-mode-hook.

\(fn)" t nil)

(or (assoc "load_list\\.txt$" auto-mode-alist) (push '("load_list\\.txt$" . magik-loadlist-mode) auto-mode-alist))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-loadlist" '("magik-loadlist-")))

;;;***

;;;### (autoloads nil "magik-menu" "magik-menu.el" (0 0 0 0))
;;; Generated autoloads from magik-menu.el

(autoload 'magik-menu-set-menus "magik-menu" "\
Setup main Magik menus.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-menu" '("magik-menu-")))

;;;***

;;;### (autoloads nil "magik-mode" "magik-mode.el" (0 0 0 0))
;;; Generated autoloads from magik-mode.el

(autoload 'magik-mode "magik-mode" "\
Major mode for editing Magik code.

Indents with the TAB or RET keys, inserts underscores, and sends Magik
to a running gis with `F2 b', `F2 m', `F2 r', or `F2 RET'.
Creates programming templates like
  _if
  _then

  _endif
with `F2 SPC' and trace statements with `F2 t'.
Fills private (#) or public (##) comments with `F2 q'.

You can customise ‘magik-mode’ with the ‘magik-mode-hook’.

\(fn)" t nil)

(or (assoc "\\.magik$" auto-mode-alist) (push '("\\.magik$" . magik-mode) auto-mode-alist))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-mode" '("magik-" "transmit-")))

;;;***

;;;### (autoloads nil "magik-module" "magik-module.el" (0 0 0 0))
;;; Generated autoloads from magik-module.el

(autoload 'magik-module-mode "magik-module" "\
Major mode for editing Magik module.def files.

You can customise Module Mode with the `module-mode-hook'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-module" '("magik-module-")))

;;;***

;;;### (autoloads nil "magik-msg" "magik-msg.el" (0 0 0 0))
;;; Generated autoloads from magik-msg.el

(autoload 'magik-msg-mode "magik-msg" "\
Major mode for editing Magik Message files.

You can customise msg-mode with the msg-mode-hook.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-msg" '("magik-msg-")))

;;;***

;;;### (autoloads nil "magik-pragma" "magik-pragma.el" (0 0 0 0))
;;; Generated autoloads from magik-pragma.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-pragma" '("magik-" "topic-select-mode-abbrev-table")))

;;;***

;;;### (autoloads nil "magik-product" "magik-product.el" (0 0 0 0))
;;; Generated autoloads from magik-product.el

(autoload 'magik-product-mode "magik-product" "\
Major mode for editing Magik product.def files.

You can customise Product Mode with the `product-mode-hook'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-product" '("magik-product-")))

;;;***

;;;### (autoloads nil "magik-shell" "magik-shell.el" (0 0 0 0))
;;; Generated autoloads from magik-shell.el

(autoload 'magik-shell "magik-shell" "\
Run a Gis process in a buffer in `magik-shell-mode'.

The command is typically \"sw_magik_win32\" or \"sw_magik_motif\", but
can be any interactive program such as \"csh\".

The program that is offered as a default is stored in the variable,
`magik-shell-command', which you can customise.  e.g.

\(setq magik-shell-command
  \"[$HOME] sw_magik_win32 -Mextdir %TEMP% -image $SMALLWORLD_GIS/images/gis.msf\"
)
The command automatically expands environment variables using
Windows %% and Unix $ and ${} nomenclature.

You can setup a list of standard commands by setting the
default value of `magik-shell-command-history'.

Prefix argument controls:
With a numeric prefix arg, switch to the Gis process of that number
where the number indicates the order it was started. The
SW->Gis Processes indicates which numbers are in use. If a Gis process
buffer is killed, its number is reused when a new Gis process is started.

With a non-numeric prefix arg, ask user for buffer name to use for
GIS.  This will default to a unique currently unused name based upon
the current value of `magik-shell-buffer-default-name'.

If there is already a Gis process running in a visible window or
frame, just switch to that buffer, or prompt if more than one.  If
there is not, prompt for a command to run, and then run it.

\(fn &optional BUFFER COMMAND)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-shell" '("magik-shell-")))

;;;***

;;;### (autoloads nil "magik-shell-filter" "magik-shell-filter.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magik-shell-filter.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-shell-filter" '("magik-shell-filter")))

;;;***

;;;### (autoloads nil "magik-template" "magik-template.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from magik-template.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-template" '("magik-template-")))

;;;***

;;;### (autoloads nil "magik-utils" "magik-utils.el" (0 0 0 0))
;;; Generated autoloads from magik-utils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-utils" '("magik-utils-" "which-file" "gsub" "global-replace-regexp" "sub" "barf-if-no-gis")))

;;;***

;;;### (autoloads nil "magik-version" "magik-version.el" (0 0 0 0))
;;; Generated autoloads from magik-version.el

(autoload 'magik-version-mode "magik-version" "\
Major Mode for gis_version.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magik-version" '("magik-version")))

;;;***

;;;### (autoloads nil nil ("magik-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; magik-mode-autoloads.el ends here
