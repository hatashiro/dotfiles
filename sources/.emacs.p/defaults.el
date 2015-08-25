(provide 'defaults)

;; autosave
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))
(make-directory "~/.emacs.d/autosaves/" t)

;; default settings
(menu-bar-mode -99)
(xterm-mouse-mode)
(setq vc-follow-symlinks t)
(set-fill-column 80)
(setq tab-width 2)
