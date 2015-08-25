(add-to-list 'load-path "~/.emacs.p/")
(let ((default-directory "~/.emacs.p/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'defaults)
(require 'packages)
(require 'keys)
(require 'settings)
