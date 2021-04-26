;;; init-fzf.el --- Emacs for fzf search -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Yaner

;; Author: Yaner <Yaner@MacBookPro.local>
;; Keywords: fzf search

;;; Commentary:
;;; Code:

(use-package fzf
  :ensure t)

(use-package fuzzy-finder
  :defer 2
  :config
  (setq fuzzy-finder-default-arguments "--multi"))

(provide 'init-fzf)
;;; init-fzf.el ends here
