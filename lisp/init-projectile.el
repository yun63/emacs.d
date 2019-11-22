;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode t)
  (setq-default projectile-mode-line-prefix " Proj")
  (use-package ag
   :ensure t)
)


(provide 'init-projectile)
;;; init-projectile.el ends here
