;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(require 'package)

;; Prefer GNU ELPA > MELPA (fallback)
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("GNU ELPA"     . 10)
        ("MELPA" . 5)))

(setq package-enable-at-startup nil)

(package-initialize)

(defun spartan-package-bootstrap ()
  (unless package-archive-contents
    (package-refresh-contents))

  (dolist (package spartan-package-list)
    (unless (package-installed-p package)
      (package-install package))))

(provide 'spartan-elpa-melpa)
