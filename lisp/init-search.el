;;; init-search.el --- search tools settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ag
  :defer t)

(use-package helm-ag
  :defer t
  :config
  (setq helm-ag-base-command "rg --line-number --smart-case --colors=line:fg:yellow --colors=line:style:bold --colors=path:fg:green --colors=path:style:bold --colors=match:fg:black --colors=match:bg:yellow --colors=match:style:nobold")
  ;; for file name
  (set-face-attribute 'helm-moccur-buffer nil
                      :foreground "green")

  ;; for line
  (set-face-attribute 'helm-grep-lineno nil
                      :background "yellow")

  ;; for matched text
  (set-face-attribute 'helm-match nil
                      :foreground "red")

  (setq helm-ag-fuzzy-match t)
  (setq helm-follow-mode-persistent t)
  (setq helm-ag-insert-at-point 'symbol)
  (setq helm-ag-use-agignore t))

(provide 'init-search)
;;; init-search.el ends here
