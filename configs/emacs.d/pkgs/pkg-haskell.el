(use-package intero
  :ensure t
  :init
  (add-hook 'haskell-mode-hook 'intero-mode)
  (add-hook 'haskell-mode-hook
    (lambda () (evil-leader/set-key
                 "hi" 'intero-info
                 "hj" 'intero-goto-definition)))
  )

(provide 'pkg-haskell)
