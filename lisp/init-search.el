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
  (setq helm-ag-base-command "rg --line-number --no-heading --smart-case --colors=line:fg:yellow --colors=line:style:bold --colors=path:fg:green --colors=path:style:bold --colors=match:fg:black --colors=match:bg:yellow --colors=match:style:nobold")
  (setq helm-ag-fuzzy-match t)
  (setq helm-follow-mode-persistent t)
  (setq helm-ag-insert-at-point 'symbol)
  (setq helm-ag-use-agignore t))

(provide 'init-search)
;;; init-search.el ends here
