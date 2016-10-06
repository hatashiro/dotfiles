;; hide menu bar
(menu-bar-mode 0)

;; line number
(global-linum-mode 1)
(setq linum-format "%d  ")

;; spaces
(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-style '(face trailing tabs))
(set-face-background 'whitespace-trailing "red")
(set-face-background 'whitespace-tab "color-236")

(provide 'custom-ui)
