(use-package rust-mode
  :ensure t

  :config
  (setq rust-format-on-save t)
  )

(use-package racer
  :ensure t

  :init
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)

  :config
  (define-key racer-mode-map (kbd "C-c C-d") 'racer-describe)
  (define-key evil-normal-state-map (kbd "M-.") nil) ;; for jump-to-definition
  )

(provide 'pkg-rust)
