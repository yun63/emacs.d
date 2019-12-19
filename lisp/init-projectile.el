;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :commands (projectile-project-root
             projectile-project-name
             projectile-project-p
             projectile-locate-dominating-file)

  :init (setq projectile-cache-file (concat emacs-local-dir "projectile.cache")
              projectile-enable-caching t
              projectile-known-projects-file (concat emacs-local-dir "projectile.projects")
              projectile-require-project-root t
              projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o")
              projectile-ignored-projects '("~/" "/tmp")
              projectile-kill-buffers-filter 'kill-only-files
              projectile-files-cache-expire 604800 ; expire after a week
              projectile-sort-order 'recentf
              projectile-use-git-grep t) ; use git-grep for text searches

  (global-set-key [remap evil-jump-to-tag] #'projectile-find-tag)
  (global-set-key [remap find-tag]         #'projectile-find-tag)
  
  :bind-keymap
  ("\C-c p" . projectile-command-map)

  :config
  (projectile-mode t)
  (setq projectile-switch-project-action #'projectile-dired)
  (setq projectile-find-dir-includes-top-level t)
  (setq projectile-completion-system 'ivy)
  (setq-default projectile-mode-line-prefix nil)

  ;; In the interest of performance, we reduce the number of project root marker
  ;; files/directories projectile searches for when resolving the project root.
  (setq projectile-project-root-files-bottom-up
        (append '(".svn"         ; Subversion VCS root dir
                  ".git"))       ; Git VCS root dir
        ;; This will be filled by other modules. We build this list manually so
        ;; projectile doesn't perform so many file checks every time it resolves
        ;; a project's root -- particularly when a file has no project.
        projectile-project-root-files '("TAGS")
        projectile-project-root-files-top-down-recurring '(".svn" "Makefile"))
  ) ;; use-package end

;; counsel-projectile
(use-package counsel-projectile
  :ensure t)

;; ibuffer-projectile
(use-package ibuffer-projectile
  :ensure t)

;; find-file-in-project
(use-package find-file-in-project
  :ensure t)

    
;; autoinsert
(use-package autoinsert
  :ensure t
  :config
  (setq auto-insert-query nil)
  (setq auto-insert-directory (locate-user-emacs-file "templates"))
  (add-hook 'find-file-hook 'auto-insert)
  (auto-insert-mode t))


(provide 'init-projectile)
;;; init-projectile.el ends here
