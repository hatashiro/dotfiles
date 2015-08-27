(provide 'settings)

;; ethan-wspace
(setq mode-require-final-newline nil)
(setq show-trailing-whitespace nil)
(require 'ethan-wspace)
(global-ethan-wspace-mode 1)

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)
(defun complete-or-indent ()
  (interactive)
  (if (looking-at " +$")
      (indent-according-to-mode)
    (company-complete-common)))

;; color scheme
(require 'base16-eighties-dark-theme)
