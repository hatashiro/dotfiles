(fset 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

(provide 'custom-etc)
