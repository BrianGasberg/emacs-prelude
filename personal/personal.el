(prelude-require-package 'yasnippet)
(prelude-require-package 'yasnippet-snippets)
(prelude-require-package 'spacemacs-theme)

(setq default-directory "~/")

;; fast cursor movement
(global-set-key (kbd "M-n")
                (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "M-p")
                (lambda () (interactive) (previous-line 5)))

(setq yas-snippet-dirs
      '("~/.emacs.d/personal/snippets"                 ;; personal snippets
        "~/.emacs.d/elpa/yasnippet-snippets-20241014.949/snippets" ;; foo-mode and bar-mode snippet collection
        ))

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

(load-theme 'spacemacs-dark)

;; Org-mode
(add-hook 'org-mode-hook (lambda () (turn-on-auto-fill)))
(add-hook 'org-mode-hook (lambda () (setq-default fill-column 120)))
(add-hook 'org-mode-hook (lambda () (setq org-lowest-priority ?D)))
(add-hook 'org-mode-hook (lambda () (setq org-highest-priority ?A)))
(add-hook 'org-mode-hook (lambda () (setq org-tags-column -116)))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "IN PROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("IN PROGRESS" . (:foreground "brightyellow" :bold t))
        ("DONE" . org-done)
        ("CANCELLED" . (:foreground "DarkOrange1" :bold t))
        ("WAITING" . (:foreground "turquoise1" :bold t))) )

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
