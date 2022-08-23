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

  :config
  (setq projectile-enable-caching t
        projectile-require-project-root nil
        projectile-project-search-path '("~/" "~/codes/" "~/sources" ("~/github" .))
        projectile-kill-buffers-filter 'kill-only-files
        projectile-auto-discover t
        projectile-files-cache-expire 604800
        projectile-sort-order 'recentf
        projectile-switch-project-action 'neotree-projectile-action
        projectile-use-git-grep t)

  (dolist (var '(".o" ".so" ".a" ".pyc" ".elc"))
    (add-to-list 'projectile-globally-ignored-file-suffixes var))

  (dolist (var '(".git" ".svn" ".clangd"))
    (add-to-list 'projectile-globally-ignored-directories var))

  (setq projectile-switch-project-action #'projectile-dired)
  (setq projectile-find-dir-includes-top-level t)
  (setq projectile-completion-system 'ivy)
  (setq-default projectile-mode-line-prefix nil)

  (setq projectile-project-root-files-bottom-up
        (append '(".svn"         ; Subversion VCS root dir
                  ".git"))       ; Git VCS root dir
        projectile-project-root-files '("TAGS")
        projectile-project-root-files-top-down-recurring '(".svn" ".git" "Makefile"))
  (projectile-mode t))

;; counsel-projectile
(use-package counsel-projectile
  :defer 2)

;; ibuffer-projectile
(use-package ibuffer-projectile
  :defer 2
  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-projectile-set-filter-groups)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))

;; find-file-in-project
(use-package find-file-in-project
  :defer 2
  :config
  (add-to-list 'ffip-ignore-filenames "*.ccls")
  (add-to-list 'ffip-prune-patterns "*/.ccls-cache"))

(use-package find-file-rg
  :defer 2)


(provide 'init-projectile)
;;; init-projectile.el ends here
