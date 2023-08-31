;;; -*- lexical-binding: t; no-byte-compile: t; -*-

;; configuration -- uncomment desired layers => C-x C-s => M-x spartan-reconfigure

(setq spartan-layers '(
                       ;; Global defaults everywhere
                       spartan-startup
                       spartan-performance
                       spartan-better-defaults
                       spartan-binds-global
                       spartan-theme

                       ;; Required for layers below
                       spartan-elpa-melpa

                       ;; for psychos
                       spartan-evil

                       ;; general, make things easier stuff
                       spartan-ido
                       spartan-flymake
                       spartan-kill-ring
                       spartan-crux

                       ;; ide-like features
                       spartan-projectile
                       spartan-magit
                       spartan-eglot

                       ;; language support
                       spartan-bash
                       spartan-c
                       spartan-elisp
                       spartan-go
                       spartan-javascript
                       spartan-nix
                       spartan-python
                       spartan-ruby
                       spartan-rust
                       spartan-terraform
                       ))

;; spartan-layers

(add-to-list 'load-path (concat user-emacs-directory "spartan-layers"))

(dolist (layer spartan-layers)
  (require layer))

;; install third party packages

(with-eval-after-load 'spartan-elpa-melpa
  (spartan-package-bootstrap))

;; M-x customize

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load-file custom-file))

;; spartan.d/

(setq spartan-lisp-d (concat user-emacs-directory "spartan.d"))

(defun spartan-user-local-hook ()
  (when (file-directory-p spartan-lisp-d)
  (dolist (file (directory-files spartan-lisp-d nil "^.*\.el$"))
    (load-file (concat spartan-lisp-d "/" file)))))

(add-hook 'emacs-startup-hook 'spartan-user-local-hook)

;; M-x spartan-reconfigure

(defun spartan-reconfigure ()
  (interactive)
  (load-file user-init-file)
  (run-hooks 'after-init-hook
             'emacs-startup-hook))

;;; init.el ends here
