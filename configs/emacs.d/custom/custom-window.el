(defun inc-win-height () (interactive) (enlarge-window 5))
(defun dec-win-height () (interactive) (shrink-window 5))
(defun inc-win-width () (interactive) (enlarge-window-horizontally 5))
(defun dec-win-width () (interactive) (shrink-window-horizontally 5))

(global-set-key (kbd "<M-up>") 'dec-win-height)
(global-set-key (kbd "<M-down>") 'inc-win-height)
(global-set-key (kbd "<M-left>") 'dec-win-width)
(global-set-key (kbd "<M-right>") 'inc-win-width)

(global-set-key (kbd "C-w") nil)
(global-set-key (kbd "C-w %") 'split-window-horizontally)
(global-set-key (kbd "C-w \"") 'split-window-vertically)

(provide 'custom-window)
