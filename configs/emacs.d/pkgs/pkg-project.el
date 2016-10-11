(use-package projectile
  :ensure t

  :config
  (projectile-mode t)
  (setq projectile-enable-caching t)
  )

(use-package counsel-projectile
  :ensure t

  :config
  (counsel-projectile-on)

  (evil-leader/set-key
    "p" 'counsel-projectile-find-file)

  (define-key ivy-minibuffer-map (kbd "<f5>")
    (lambda ()
      (interactive)
      (ivy-quit-and-run
       (projectile-invalidate-cache nil)
       (counsel-projectile-find-file))
      ))
  )

(provide 'pkg-project)
