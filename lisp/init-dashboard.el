;;; init-dashboard.el --- Conguration for Emacs theme faces -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
  (setq dashboard-startup-banner 2)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-init-info t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-footer "Dashboard is pretty cool!")
  (setq dashboard-projects-switch-function 'counsel-projectile-switch-project-by-name)
  (setq dashboard-items '((projects . 10)
                          (recents  . 10)
                          (agenda . 10))))


(provide 'init-dashboard)
;;; init-dashboard.el ends here
