(use-package swiper
  :ensure t

  :config
  (ivy-mode 1)

  ;; use ctrl-j/k to navigate lines
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)

  ;; fuzzy
  (setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))
  )

(provide 'pkg-ivy)
