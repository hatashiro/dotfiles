(use-package web-mode
  :ensure t
  :config
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-script-padding 0)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-style-padding 0)

  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mjs?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))

  (add-to-list 'web-mode-comment-formats '("javascript" . "//" ))
  (add-to-list 'web-mode-comment-formats '("jsx" . "//" ))
  (add-to-list 'web-mode-comment-formats '("html" . "//" ))

  (add-hook 'web-mode-hook
            (lambda ()
              (global-set-key (kbd "C-\\") 'web-mode-comment-or-uncomment)
              ))
  )

(use-package mmm-mode
  :ensure t
  :config
  (setq mmm-parse-when-idle t)
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
  )

(use-package tide
  :ensure t
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    ;; `M-x package-install [ret] company`
    (company-mode +1))

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  ;; formats the buffer before saving
  (add-hook 'typescript-mode-hook #'setup-tide-mode)

  ;; format options
  (setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))
  )

(provide 'pkg-javascript)
