(use-package evil-leader
  :ensure t

  :config
  (global-evil-leader-mode)

  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "<SPC>" 'execute-extended-command
    "w" 'switch-to-buffer
    "t" 'neotree-toggle)
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

(defun evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(evil-define-command evil-set-tab-size (size)
  :repeat nil
  (interactive "<f>")
  (setq js-indent-level (string-to-number size))
  (setq evil-shift-width (string-to-number size)))

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
  (evil-ex-define-cmd "Ts" 'evil-set-tab-size)

  ;; shift
  (add-hook 'after-change-major-mode-hook (lambda () (setq evil-shift-width 2)))
  (define-key evil-visual-state-map (kbd ">") 'evil-shift-right-visual)
  (define-key evil-visual-state-map (kbd "<") 'evil-shift-left-visual)
  )

(provide 'pkg-evil)
