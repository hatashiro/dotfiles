(use-package neotree
  :ensure t

  :config
  (setq neo-smart-open t
      neo-show-header nil
      neo-show-hidden-files t
      neo-banner-message nil
      neo-create-file-auto-open t
      neo-window-width 25)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  )

(provide 'pkg-neotree)
