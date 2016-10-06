(use-package evil-leader
  :ensure t

  :config
  (global-evil-leader-mode)

  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "<SPC>" 'execute-extended-command
    "e" 'find-file)
  )

(use-package evil-nerd-commenter
  :ensure t

  :config
  (global-set-key (kbd "C-\\") 'evilnc-comment-or-uncomment-lines)
  )

(use-package evil-snipe
  :ensure t

  :config
  (evil-snipe-override-mode 1)
  (setq evil-snipe-scope 'buffer)
  )

(use-package evil
  :ensure t

  :bind (
    ;; bind ctrl-j/k to just move
    ("C-j" . evil-next-line)
    ("C-k" . evil-previous-line)
    )

  :config
  (evil-mode 1)

  ;; command alias
  (evil-ex-define-cmd "W" "w")
  (evil-ex-define-cmd "Wq" "wq")
  (evil-ex-define-cmd "WQ" "wq")
  (evil-ex-define-cmd "Q" "q")
  )

(provide 'pkg-evil)
