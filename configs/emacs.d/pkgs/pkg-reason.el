(add-to-list 'load-path "./pkg-reason/")

;;----------------------------------------------------------------------------
;; Reason setup
;;----------------------------------------------------------------------------

(defun shell-cmd (cmd)
  "Returns the stdout output of a shell command or nil if the command returned
   an error"
  (car (ignore-errors (apply 'process-lines (split-string cmd)))))

(let* ((refmt-bin (or (shell-cmd "refmt ----where")
                      (shell-cmd "which refmt")))
       (merlin-bin (or (shell-cmd "ocamlmerlin ----where")
                       (shell-cmd "which ocamlmerlin")))
       (merlin-base-dir (when merlin-bin
                          (replace-regexp-in-string "bin/ocamlmerlin$" "" merlin-bin))))
  ;; Add npm merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
  (when merlin-bin
    (add-to-list 'load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
    (setq merlin-command merlin-bin))

  (when refmt-bin
    (setq refmt-command refmt-bin)))

(require 'reason-mode)
(require 'merlin)
(add-hook
 'reason-mode-hook
 (lambda ()
   (add-hook 'before-save-hook 'refmt-before-save)
   (merlin-mode)
   (local-set-key (kbd "M-.") 'merlin-locate)
   (local-set-key (kbd "M-,") 'merlin-pop-stack)
   (local-set-key (kbd "M-/") 'merlin-type-enclosing)
   )
 )

(setq merlin-ac-setup t)

(provide 'pkg-reason)
