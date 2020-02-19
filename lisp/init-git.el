;;; init-git.el --- Git SCM support -*- lexical-binding: t -*-
;;; Commentary:

;; See also init-github.el.

;;; Code:

(use-package magit
  :requires (gitignore-mode gitconfig-mode)
  :defer t
  :config
  (setq magit-auto-revert-mode nil)
  (setq-default magit-diff-refine-hunk t)
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-dispatch))
  
(provide 'init-git)
;;; init-git.el ends here
