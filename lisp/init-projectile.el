;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package projectile
  :defer 1
  :commands (projectile-project-root
             projectile-project-name
             projectile-project-p
             projectile-locate-dominating-file)

  :init
  (global-set-key [remap evil-jump-to-tag] #'projectile-find-tag)
  (global-set-key [remap find-tag]         #'projectile-find-tag)
  
  :bind-keymap
  ("\C-c p" . projectile-command-map)

  :config (setq projectile-enable-caching t
                projectile-require-project-root nil
                projectile-ignored-projects '("~/" "/tmp")
                projectile-kill-buffers-filter 'kill-only-files
                projectile-files-cache-expire 604800
                projectile-sort-order 'recentf
                projectile-switch-project-action 'neotree-projectile-action
                projectile-use-git-grep t)

  (dolist (var '(".o" ".so" ".a" ".pyc" ".elc"))
    (add-to-list 'projectile-globally-ignored-file-suffixes var))

  (dolist (var '(".git" ".svn" ".ccls-cache"))
    (add-to-list 'projectile-globally-ignored-directories var))

  (add-to-list 'projectile-globally-ignored-files ".ccls")

  (setq projectile-switch-project-action #'projectile-dired)
  (setq projectile-find-dir-includes-top-level t)
  (setq projectile-completion-system 'ivy)
  (setq-default projectile-mode-line-prefix nil)

  (setq projectile-project-root-files-bottom-up
        (append '(".svn"         ; Subversion VCS root dir
                  ".git"))       ; Git VCS root dir
        projectile-project-root-files '("TAGS")
        projectile-project-root-files-top-down-recurring '(".svn" "Makefile"))
  (projectile-mode t)
  ) ;; use-package end

;; counsel-projectile
(use-package counsel-projectile
  :defer 2)

;; ibuffer-projectile
(use-package ibuffer-projectile
  :defer 2)

;; find-file-in-project
(use-package find-file-in-project
  :defer 2
  :config
  (add-to-list 'ffip-ignore-filenames "*.ccls")
  (add-to-list 'ffip-prune-patterns "*/.ccls-cache"))

;; autoinsert
(use-package autoinsert
  :defer 2
  :config
  (setq auto-insert-query nil)
  (setq auto-insert-directory (locate-user-emacs-file "templates"))
  (add-hook 'find-file-hook 'auto-insert)
  (auto-insert-mode t))


(provide 'init-projectile)
;;; init-projectile.el ends here
