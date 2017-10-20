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
  (setq css-indent-offset (string-to-number size))
  (setq evil-shift-width (string-to-number size))
  (setq web-mode-code-indent-offset (string-to-number size))
  (setq web-mode-css-indent-offset (string-to-number size))
  )

(use-package evil
  :ensure t

  :bind (
    ;; bind ctrl-j/k to just move
    ("C-j" . evil-next-line)
    ("C-k" . evil-previous-line)
    ("C-d" . evil-scroll-down)
    ("C-u" . evil-scroll-up)
    )

  :config
  (evil-mode 1)

  ;; command alias
  (evil-ex-define-cmd "W" "w")
  (evil-ex-define-cmd "Wq" "wq")
  (evil-ex-define-cmd "WQ" "wq")
  (evil-ex-define-cmd "Q" "q")
  (evil-ex-define-cmd "S" "s")
  (evil-ex-define-cmd "Ts" 'evil-set-tab-size)

  ;; shift
  (add-hook 'after-change-major-mode-hook (lambda () (setq evil-shift-width 2)))
  (define-key evil-visual-state-map (kbd ">") 'evil-shift-right-visual)
  (define-key evil-visual-state-map (kbd "<") 'evil-shift-left-visual)

  ;; search module
  (setq evil-search-module t)
  )

(use-package evil-visualstar
  :ensure t
  :init
  (global-evil-visualstar-mode)
  )

(use-package evil-mc
  :ensure t
  :init
  (require 'evil-mc)
  (global-evil-mc-mode 1)
  (defun col-at-point (point)
    (save-excursion (goto-char point) (current-column)))

  (defun evil--mc-make-cursor-at-col-insert (startcol _endcol orig-line)
    (end-of-line)
    (move-to-column startcol)
    (unless (or (= (line-number-at-pos) orig-line) (> startcol (current-column)))
      (evil-mc-make-cursor-here)))

  (defun evil--mc-make-vertical-cursors (beg end func)
    (evil-mc-pause-cursors)
    (apply-on-rectangle func
                        beg end (line-number-at-pos (point)))
    (evil-mc-resume-cursors)
    (evil-normal-state))

  (defun evil-mc-insert-vertical-cursors (beg end)
    (interactive (list (region-beginning) (region-end)))
    (evil--mc-make-vertical-cursors beg end 'evil--mc-make-cursor-at-col-insert)
    (move-to-column (min (col-at-point beg) (col-at-point end))))

  (evil-define-key 'visual global-map "gI" 'evil-mc-insert-vertical-cursors)
  (evil-define-key 'normal evil-mc-key-map (kbd "<escape>") 'evil-mc-undo-all-cursors)
  (evil-define-key 'normal evil-mc-key-map (kbd "C-p") nil)

  (nconc evil-mc-known-commands
         '((typescript-insert-and-indent . ((self-insert-command . evil-mc-execute-default-call-with-count)))
           )
         )
  )

(provide 'pkg-evil)
