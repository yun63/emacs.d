;;; init-theme.el --- Conguration for Emacs theme faces -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  ;;(doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  (load-theme 'dracula t)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

  (load-theme 'dracula t)

  (use-package beacon
    :defer 2
    :hook (after-init . beacon-mode)
    :diminish beacon-mode
    :config
    (setq-default beacon-lighter " ")
    (setq-default beacon-color "#ff0000")
    (setq-default beacon-size 20))

  (use-package rainbow-delimiters
    :ensure t
    :init
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
    )
 )

(use-package all-the-icons
  :if (display-graphic-p))


(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-icon nil)
  (setq doom-modeline-major-mode-icon nil)

  (use-package nerd-icons
    :defer 2
    :ensure t)
  )

(use-package neotree
  :defer 2
  :custom
  (neo-theme 'nerd2))

(use-package corfu
  :hook
  (after-init . global-corfu-mode)
  :config
  (setq-local corfu-auto t
              corfu-auto-delay 0
              corfu-auto-prefix 0
              completion-styles '(basic))

  (use-package popon
    :ensure t)
  )

(use-package undo-tree
  :defer 2
  :hook
  (after-init . global-undo-tree-mode)
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  )

(provide 'init-themes)
;;; init-themes.el ends here
