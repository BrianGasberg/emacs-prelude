(prelude-require-package 'yasnippet)
(prelude-require-package 'yasnippet-snippets)

(setq yas-snippet-dirs
      '("~/.emacs.d/personal/snippets"                 ;; personal snippets
        "~/.emacs.d/elpa/yasnippet-snippets-20241014.949/snippets" ;; foo-mode and bar-mode snippet collection
        ))

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

(load-theme 'spacemacs-dark)
