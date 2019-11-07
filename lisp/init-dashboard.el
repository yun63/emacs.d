;;; init-dashboard.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
(setq dashboard-show-shortcuts nil)
(setq dashboard-items '((recents  . 5)
			(bookmarks . 5)
			(projects . 5)
			(agenda . 5)))

(provide 'init-dashboard)

;;; init-dashboard.el ends here
