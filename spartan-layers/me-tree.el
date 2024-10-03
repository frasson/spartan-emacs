(use-package nerd-icons
  :straight t)

(use-package neotree
  :straight t
  :custom
  (neo-theme 'nerd-icons))

(global-set-key (kbd "C-b") 'neotree-toggle)

(defun disable-line-numbers-in-neotree ()
  (when (derived-mode-p 'neotree-mode)
    (display-line-numbers-mode -1)))

(add-hook 'neotree-mode-hook 'disable-line-numbers-in-neotree)

(provide 'me-tree)
