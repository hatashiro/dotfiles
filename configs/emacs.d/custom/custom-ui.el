;; hide menu bar
(menu-bar-mode 0)

;; line number
(global-linum-mode 1)
(setq linum-format "%d  ")

;; spaces
(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-style '(face trailing tabs lines-tail))
(setq whitespace-line-column 80)
(set-face-background 'whitespace-trailing "red")
(set-face-background 'whitespace-tab "gray20")
(set-face-foreground 'whitespace-line nil)
(set-face-background 'whitespace-line "gray20")

;; (line, column)
(setq line-number-mode t)
(setq column-number-mode t)

;; fill column length
(setq-default fill-column 80)

(provide 'custom-ui)
