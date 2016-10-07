(defun pbpaste ()
  "Paste data from clipboard"
  (interactive)
  (shell-command-on-region
   (point)
   (if mark-active (mark) (point))
   "pbpaste" nil t))

(defun pbcopy ()
  "Copy region to clipboard"
  (interactive)
  (print (mark))
  (when mark-active
    (shell-command-on-region
     (point) (mark) "pbcopy")
    (kill-buffer "*Shell Command Output*")))

(evil-leader/set-key
  "y" 'pbcopy
  "p" 'pbpaste)

(provide 'custom-copy)
