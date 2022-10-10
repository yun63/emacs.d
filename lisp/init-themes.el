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
  (load-theme 'dracula)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

  (use-package beacon
    :defer 2
    :hook (after-init . beacon-mode)
    :diminish beacon-mode
    :config
    (setq-default beacon-lighter " ")
    (setq-default beacon-color "#ff0000")
    (setq-default beacon-size 20))
 )

(use-package all-the-icons
  :ensure t
  :defer 2)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))


(use-package rainbow-delimiters
  :hook (after-init . rainbow-delimiters-mode))


(use-package neotree
  :defer 2
  :custom
  (neo-theme 'nerd2))

(provide 'init-themes)
;;; init-themes.el ends here
