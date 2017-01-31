(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)

  ;; disable downcase
  (setq company-dabbrev-downcase nil)

  ;; use ctrl-j/k to navigate lines
  (define-key company-active-map (kbd "C-j") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous)

  ;; use C-p to start completion in insert mode
  (define-key evil-insert-state-map (kbd "C-p") 'company-complete)

  ;; custom faces
  (custom-set-faces
   '(company-tooltip-selection ((t (:background "#262626"))))
   '(company-scrollbar-bg ((t (:background "#303030"))))
   '(company-scrollbar-fg ((t (:background "#3a3a3a")))))
  )

(provide 'pkg-completion)
