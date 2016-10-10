(evil-define-operator evil-pbcopy (beg end type register yank-handler)
  :move-point nil
  :repeat nil
  (interactive "<R><x><y>")
  (let ((evil-was-yanked-without-register
         (and evil-was-yanked-without-register (not register))))
    (cond
     ((and (fboundp 'cua--global-mark-active)
           (fboundp 'cua-copy-region-to-global-mark)
           (cua--global-mark-active))
      (cua-copy-region-to-global-mark beg end))
     ((eq type 'block)
      (shell-command-on-region beg end "pbcopy"))
     ((eq type 'line)
      (shell-command-on-region beg end "pbcopy"))
     (t
      (shell-command-on-region beg end "pbcopy")))))

(evil-define-operator evil-pbcopy-line (beg end type register)
  :motion evil-line
  :move-point nil
  (interactive "<R><x>")
  (when (evil-visual-state-p)
    (unless (memq type '(line block))
      (let ((range (evil-expand beg end 'line)))
        (setq beg (evil-range-beginning range)
              end (evil-range-end range)
              type (evil-type range))))
    (evil-exit-visual-state))
  (shell-command-on-region beg end "pbcopy")
  (kill-buffer "*Shell Command Output*"))

(defun evil-pbpaste ()
  "Paste data from clipboard"
  (interactive)
  (evil-append-line nil)
  (newline)
  (evil-normal-state)
  (shell-command-on-region (point) (if mark-active (mark) (point)) "pbpaste" nil t)
  (backward-delete-char-untabify 1))

(define-key evil-motion-state-map (kbd "C-y") 'evil-pbcopy)
(define-key evil-normal-state-map (kbd "C-y") 'evil-pbcopy-line)
(define-key evil-normal-state-map (kbd "C-p") 'evil-pbpaste)

(provide 'custom-copy)
