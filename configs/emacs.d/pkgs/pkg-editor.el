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

(setq ad-redefinition-action 'accept)

(use-package isearch+
  :ensure t
  )

(use-package modeline-posn
  :ensure t
  )

(provide 'pkg-editor)
