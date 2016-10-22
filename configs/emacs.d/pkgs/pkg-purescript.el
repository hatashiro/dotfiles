(use-package purescript-mode
  :ensure t
  )

(use-package psc-ide
  :ensure t

  :config
  (add-hook 'purescript-mode-hook
    (lambda ()
      (psc-ide-mode)
      (company-mode)
      (flycheck-mode)
      (turn-on-purescript-indentation)))
  )

(provide 'pkg-purescript)
