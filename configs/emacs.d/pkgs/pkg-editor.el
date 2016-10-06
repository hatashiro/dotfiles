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

(provide 'pkg-editor)
