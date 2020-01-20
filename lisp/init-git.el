;;; init-git.el --- Git SCM support -*- lexical-binding: t -*-
;;; Commentary:

;; See also init-github.el.

;;; Code:

(use-package magit
  :requires (git-blamed gitignore-mode gitconfig-mode git-timemachine-toggle)
  :defer 2
  :config
  (setq-default magit-diff-refine-hunk t)
  (magit-auto-revert-mode nil)
  (global-set-key (kbd "C-x v t") 'git-timemachine-toggle)
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-dispatch))
  
(provide 'init-git)
;;; init-git.el ends here
