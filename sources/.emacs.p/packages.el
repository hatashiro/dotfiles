(provide 'packages)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(defun install-my-packages()
  "Install my packages."
  (interactive)
  (package-install 'js2-mode)
  (package-install 'company)
  )

(require 'js2-mode)
(require 'company)
