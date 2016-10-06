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
