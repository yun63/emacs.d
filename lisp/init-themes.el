;;; init-theme.el --- Conguration for Emacs theme faces -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

;;  (use-package moe-theme
;;    :config
;;    (declare-function moe-theme-set-color "moe-theme.el")
;;    (declare-function moe-dark "moe-theme.el")
;;    (setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
;;    (setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
;;    (moe-theme-set-color 'red)
;;    (moe-dark))
  (load-theme 'doom-dark+ t)

  (use-package rainbow-delimiters
    :defer 2
    :hook (prog-mode . rainbow-delimiters-mode))

  (use-package beacon
    :defer 2
    :hook (after-init . beacon-mode)
    :diminish beacon-mode
    :config
    (setq-default beacon-lighter " ")
    (setq-default beacon-color "#ff0000")
    (setq-default beacon-size 20))

  (use-package autopair
    :defer 2
    :hook (prog-mode . autopair-global-mode)
    :config
    (setq autopair-blink nil))
  )


(use-package doom-modeline
  :config
  (doom-modeline-mode)
  (setq doom-modeline-height 25)
  (setq doom-modeline-project-detection 'projectile)
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (setq doom-modeline-icon (display-graphic-p))
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-state-icon nil)
  (setq doom-modeline-buffer-modification-icon t)
  (setq doom-modeline-unicode-fallback t)
  (setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
  (setq doom-modeline-buffer-encoding t)
  (setq doom-modeline-number-limit 99)
  (setq doom-modeline-persp-name t)
  (setq doom-modeline-github t)
  (setq doom-modeline-github-interval (* 30 60))
  (setq doom-modeline-env-version t)
  )

(use-package dashboard
  :after (doom-themes doom-modeline)
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-items '((projects . 5)
                          (recents  . 10)
                          (agenda . 10)))
  (setq page-break-lines-char ?-)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-init-info t)
  (setq dashboard-set-footer nil)
  (setq dashboard-footer "Dashboard is pretty cool!")
  (setq dashboard-org-agenda-categories '("Tasks" "Appointments"))

  (defun dashboard-goto-projects ()
    "Go to projects."
    (interactive)
    (funcall (local-key-binding "p")))

  (define-key dashboard-mode-map (kbd "g") 'dashboard-refresh-buffer)
  (define-key dashboard-mode-map (kbd "p") 'dashboard-goto-projects)

  (dashboard-setup-startup-hook))


(use-package neotree
  :defer 2
  :config
  (add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
      (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
      (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
      (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
      (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
      (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
      (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)
      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))

(provide 'init-themes)
;;; init-themes.el ends here
