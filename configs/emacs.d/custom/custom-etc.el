(fset 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; always add a new line at the end of files
(setq require-final-newline t)
(setq mode-require-final-newline t)

(provide 'custom-etc)
