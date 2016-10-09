(defun haskell-evil-open-above ()
  (interactive)
  (evil-digit-argument-or-evil-beginning-of-line)
  (haskell-indentation-newline-and-indent)
  (evil-previous-line)
  (haskell-indentation-indent-line)
  (evil-append-line nil)
  )

(defun haskell-evil-open-below ()
  (interactive)
  (evil-append-line nil)
  (haskell-indentation-newline-and-indent)
  )

(use-package intero
  :ensure t

  :init
  (add-hook 'haskell-mode-hook 'intero-mode)
  (add-hook 'haskell-mode-hook (lambda () (evil-leader/set-key
                                            "hi" 'intero-info
                                            "hj" 'intero-goto-definition)))
  ;; override open behaviours
  (evil-define-key 'normal haskell-mode-map "o" 'haskell-evil-open-below
                                            "O" 'haskell-evil-open-above)
  )

(provide 'pkg-haskell)
