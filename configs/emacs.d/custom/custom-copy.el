(evil-define-operator pbcopy (beg end type register)
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

(defun pbpaste ()
  "Paste data from clipboard"
  (interactive)
  (evil-append-line nil)
  (newline)
  (evil-normal-state)
  (shell-command-on-region (point) (if mark-active (mark) (point)) "pbpaste" nil t)
  (backward-delete-char-untabify 1))

(define-key evil-motion-state-map (kbd "C-y") 'pbcopy)
(define-key evil-normal-state-map (kbd "C-y") 'pbcopy)
(define-key evil-normal-state-map (kbd "C-p") 'pbpaste)

(provide 'custom-copy)
