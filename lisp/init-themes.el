;;; init-theme.el --- Conguration for Emacs theme faces -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'spacemacs-dark t)
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-init-info t)
  (setq dashboard-set-footer nil)
  (setq dashboard-footer "Dashboard is pretty cool!")
  (setq show-week-agenda-p t)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

  (use-package rainbow-delimiters
    :defer 2
    :hook (prog-mode . rainbow-delimiters-mode))

  (use-package beacon
    :defer 2
    :hook (after-init . beacon-mode)
    :config
    (setq-default beacon-lighter " ")
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
  ;;(set-face-attribute 'mode-line           nil :background "grey22")
  (setq doom-modeline-height 25)
  (setq doom-modeline-project-detection 'projectile)
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (setq doom-modeline-icon (display-graphic-p))
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-state-icon t)
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
  (setq dashboard-items '((projects . 3)
                          (recents  . 5)
                          (agenda . 5)))
  (setq page-break-lines-char ?-)
  (setq dashboard-set-navigator t)
  (setq show-week-agenda-p t)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                  (bookmarks . "book")))
  (setq dashboard-org-agenda-categories '("Tasks" "Appointments"))

  (defun dashboard-goto-projects ()
    "Go to projects."
    (interactive)
    (funcall (local-key-binding "p")))

  (with-eval-after-load 'evil
    (evil-define-key 'normal dashboard-mode-map
      "g" 'dashboard-refresh-buffer
      "p" 'dashboard-goto-projects))

  (dashboard-setup-startup-hook))


(use-package neotree
  :defer 2
  :config
  (evil-leader/set-key "m"  'neotree-toggle)
  (evil-leader/set-key "n"  'neotree-project-dir)
  (setq projectile-switch-project-action 'neotree-projectile-action)
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

;;(use-package spacemacs-theme
;;    :defer 2
;;    :init
;;    (load-theme 'spacemacs-dark t)
;;    
;;    (use-package rainbow-delimiters
;;      :defer 2
;;      :hook (prog-mode . rainbow-delimiters-mode))
;;
;;    (use-package beacon
;;      :defer 2
;;      :hook (after-init . beacon-mode)
;;      :config
;;      (setq-default beacon-lighter " ")
;;      (setq-default beacon-size 20))
;;
;;    (use-package autopair
;;      :hook (prog-mode . autopair-global-mode)
;;      :config
;;      (setq autopair-blink nil))
;;    )


;;(use-package telephone-line
;;    :config
;;    (set-face-attribute 'mode-line           nil :background "grey22")
;;
;;    (setq telephone-line-primary-left-separator 'telephone-line-gradient
;;          telephone-line-secondary-left-separator 'telephone-line-nil
;;          telephone-line-primary-right-separator 'telephone-line-gradient
;;          telephone-line-secondary-right-separator 'telephone-line-nil)
;;    
;;    (setq telephone-line-height 24
;;          telephone-line-evil-use-short-tag nil)
;;    
;;    (setq telephone-line-lhs
;;          '((evil   . (telephone-line-evil-tag-segment))
;;            (nil    . (telephone-line-erc-modified-channels-segment
;;                       telephone-line-process-segment))
;;            (nil    . (telephone-line-buffer-segment))))
;;
;;    (setq telephone-line-rhs
;;          '((nil    . (telephone-line-misc-info-segment))
;;            (nil    . (telephone-line-atom-encoding-segment))
;;            (nil    . (telephone-line-major-mode-segment))
;;            (nil    . (telephone-line-vc-segment))
;;            (evil   . (telephone-line-airline-position-segment))))
;;    (telephone-line-mode 1))

(provide 'init-themes)
;;; init-ui.el ends here
