(use-package js2-mode
  :ensure t
  )

(use-package web-mode
  :ensure t
  :config
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-script-padding 0)
  (setq web-mode-markup-indent-offset 2)
  )

(use-package mmm-mode
  :ensure t
  :config
  (setq mmm-global-mode 'maybe)

  (dolist (langsets '(("script" . ((coffee . coffee-mode)
                                   (es6    . js2-mode)))
                      ("style"  . ((stylus . stylus-mode)
                                   (less   . less-css-mode)
                                   (scss   . scss-mode)))))
    (let ((tag (car langsets)))
      (dolist (pair (cdr langsets))
        (let* ((lang       (car pair))
               (submode    (cdr pair))
               (class-name (make-symbol (format "vueify-%s-%s" tag lang)))
               (front      (format "<%s lang=\"%s\">" tag lang))
               (back       (format "</%s>" tag)))
          (mmm-add-classes
           `((,class-name
              :submode ,submode
              :front ,front
              :back ,back)))
          (mmm-add-mode-ext-class nil "\\.vue?\\'" class-name)))))

  (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
  )

(provide 'pkg-javascript)
