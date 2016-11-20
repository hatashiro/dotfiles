(use-package editorconfig
  :ensure t
  :init
  (add-hook 'prog-mode-hook (editorconfig-mode 1))
  (add-hook 'text-mode-hook (editorconfig-mode 1)))

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (show-smartparens-global-mode t)
  (set-face-attribute 'sp-show-pair-match-face nil
                      :underline nil
                      :foreground "red")
  )

(use-package fill-column-indicator
  :ensure t
  :init
  (setq-default fci-rule-column 80)
  (setq fci-rule-width 1)
  (setq fci-rule-color "black")
  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1)
  )

(provide 'pkg-editor)
