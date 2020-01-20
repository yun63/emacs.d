;;; init-theme.el --- Conguration for Emacs theme faces -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package doom-themes
  :init
  (load-theme 'spacemacs-dark t)
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
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
    :hook (prog-mode . rainbow-delimiters-mode))

  (use-package beacon
    :hook (after-init . beacon-mode)
    :config
    (setq-default beacon-lighter " ")
    (setq-default beacon-size 20))

  (use-package autopair
    :hook (prog-mode . autopair-global-mode)
    :config
    (setq autopair-blink nil))
  )


(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  ;;(set-face-attribute 'mode-line           nil :background "grey22")
  (setq doom-modeline-height 25)
  (setq doom-modeline-project-detection 'projectile)
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
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
