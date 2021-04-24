;;; init-search.el --- search tools settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ag
  :defer 2
  :config
  (setq ag-reuse-window 't))

(use-package fiplr
  :defer 2)

(use-package helm-rg
  :defer 2)

(use-package helm-ag
  :config
  (setq helm-ag-base-command "rg --line-number --no-heading --smart-case")
  (setq helm-ag-fuzzy-match t)
  (setq helm-ag-use-agignore t))

(provide 'init-search)
;;; init-search.el ends here
