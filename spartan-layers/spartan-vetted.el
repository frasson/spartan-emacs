;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(add-to-list 'load-path (concat user-emacs-directory "spartan-lisp-vetted"))

(require 'paredit)
(require 'flymake-shellcheck)
(require 'docker-tramp)
(require 'browse-kill-ring)
(require 'crux)
(require 'better-shell)
(require 'shx)
(require 'termbin)

(provide 'spartan-vetted)
