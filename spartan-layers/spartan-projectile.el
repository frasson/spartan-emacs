;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package projectile
  :bind-keymap ("C-c p" . projectile-command-map)
  :straight t
  :demand t
  :config
  (projectile-mode 1)

  (with-eval-after-load 'magit
    ;; https://emacs.stackexchange.com/questions/32634/how-can-the-list-of-projects-used-by-projectile-be-manually-updated
    (mapc #'projectile-add-known-project
          (mapcar #'file-name-as-directory (magit-list-repos)))
    (projectile-save-known-projects))

  (defalias 'pro 'projectile-commander))

(provide 'spartan-projectile)
