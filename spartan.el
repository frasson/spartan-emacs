;; Spartan.el Emacs General Settings

(setq spartan-persistent-scratch t  ; t or nil
      spartan-minimal-modeline t    ; t or nil
      spartan-preferred-shell "bash" ; must be available on PATH
      magit-repository-directories '(("~/repos" . 1)) ; where your projects live
      initial-major-mode 'fundamental-mode
      initial-scratch-message "This is a persistent, unkillable scratch pad, stored to ~/.emacs.d/scratch")

;; Font settings

(set-face-attribute 'default nil :family "Monospace" :height 110)

(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)

;; Theme customization settings

(with-eval-after-load 'spartan-theme
  (spartan-install-themes
    ;; Add as many themes to install as you'd like here
    dracula-theme)

  ;; Load specific theme variant by modifying here
  (load-theme 'dracula t))

;; Transparency
;; (set-frame-parameter nil 'alpha-background 75) ; This frame
;; (add-to-list 'default-frame-alist '(alpha-background . 75)) ; New frames

;; Dashboard customization settings

(setq dashboard-startup-banner 'ascii)
(setq dashboard-banner-ascii "

   ▄████████   ▄▄▄▄███▄▄▄▄      ▄████████  ▄████████    ▄████████
  ███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███ ███    ███   ███    ███
  ███    █▀  ███   ███   ███   ███    ███ ███    █▀    ███    █▀
 ▄███▄▄▄     ███   ███   ███   ███    ███ ███          ███
▀▀███▀▀▀     ███   ███   ███ ▀███████████ ███        ▀███████████
  ███    █▄  ███   ███   ███   ███    ███ ███    █▄           ███
  ███    ███ ███   ███   ███   ███    ███ ███    ███    ▄█    ███
  ██████████  ▀█   ███   █▀    ███    █▀  ████████▀   ▄████████▀


")
(setq dashboard-center-content t)
(setq dashboard-banner-logo-title "Spartan edition")
(and (file-exists-p spartan-first-time-run-has-completed)
     (setq dashboard-footer-messages '("Vincit qui se vincit.")))

(setq dashboard-items '((recents  . 5)
                        ;; (bookmarks . 5)
                        ;; (projects . 5)
                        (agenda . 5)
                        ;; (registers . 5)
                        ))

;; Layers
(setq spartan-layers '(
                       spartan-better-defaults
                       spartan-theme
                       spartan-dashboard
                       spartan-vertico
                       spartan-flymake
                       spartan-crux
                       spartan-magit
                       spartan-projectile
                       spartan-eglot
                       spartan-company
                       spartan-shell
                       spartan-c
                       me-tree
                       me-org
                       ))
                       
(use-package which-key
  :straight t
  :ensure t
  :config (which-key-mode))                       

(use-package auto-complete
  :straight t
  :ensure t
  :init 
  (progn 
    (ac-config-default)
    (global-auto-complete-mode t)))

(use-package ace-window
  :straight t
  :bind (("M-o" . ace-window))
  :custom
  (aw-dispatch-always t))

(global-set-key (kbd "C-<tab>") 'other-window)