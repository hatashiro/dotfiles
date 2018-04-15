(use-package go-mode
  :ensure t

  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq-default tab-width 2)
  (define-key evil-normal-state-map (kbd "M-.") 'godef-jump)
  )

(use-package company-go
  :ensure t

  :config
  (add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'company-backends) '(company-go))
                            (company-mode)))
  )

(provide 'pkg-go)
