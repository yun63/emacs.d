;;; init-github.el --- Github integration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package yagist
  :defer 2)

(use-package bug-reference-github
  :defer 2
  :hook (prog-mode . bug-reference-prog-mode))

(use-package github-clone
  :defer 2)

(use-package github-review
  :defer 2)


(provide 'init-github)
;;; init-github.el ends here
