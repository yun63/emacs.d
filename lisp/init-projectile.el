;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :bind-keymap
  ("\C-c p" . projectile-command-map)
  :config
  (projectile-mode t)
  (projectile-cleanup-known-projects)
  (setq projectile-completion-system 'ivy)
  (setq-default projectile-mode-line-prefix " Proj")
  (use-package counsel-projectile
    :ensure t)

  (use-package ibuffer-projectile
    :ensure t)

  (use-package ag
    :ensure t)
    
  (use-package autoinsert
    :ensure t
    :config
    (setq auto-insert-query nil)
    (setq auto-insert-directory (locate-user-emacs-file "templates"))
    (add-hook 'find-file-hook 'auto-insert)
    (auto-insert-mode t))
  )



(provide 'init-projectile)
;;; init-projectile.el ends here
