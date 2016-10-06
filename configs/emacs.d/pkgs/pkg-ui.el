(use-package spacemacs-theme
  :ensure t
  :defer t
  :init
  (custom-set-variables
    '(spacemacs-theme-custom-colors '((bg1 . "black")
                                      (act1 . "black")
                                      (bg2 . "black")
                                      (lnum . "brightwhite"))))
  (load-theme 'spacemacs-dark t)
  )

(provide 'pkg-ui)
