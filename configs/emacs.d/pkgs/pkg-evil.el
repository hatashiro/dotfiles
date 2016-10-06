(use-package evil-leader
  :ensure t

  :config
  (require 'evil-leader)
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

(use-package evil
  :ensure t

  :bind (
    ;; bind ctrl-j/k to just move
    ("C-j" . evil-next-line)
    ("C-k" . evil-previous-line)
    )

  :config
  (require 'evil)
  (evil-mode 1)

  ;; command alias
  (evil-ex-define-cmd "W" "w")
  (evil-ex-define-cmd "Wq" "wq")
  (evil-ex-define-cmd "WQ" "wq")
  (evil-ex-define-cmd "Q" "q")
  )

(provide 'pkg-evil)
