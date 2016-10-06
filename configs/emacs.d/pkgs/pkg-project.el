(use-package projectile
  :ensure t

  :config
  (projectile-mode t)
  )

(use-package counsel-projectile
  :ensure t

  :config
  (counsel-projectile-on)

  (evil-leader/set-key
    "e" 'counsel-projectile-find-file)
  )

(provide 'pkg-project)
