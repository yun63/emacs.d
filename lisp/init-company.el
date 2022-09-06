;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(use-package company
  :hook
  (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (setq completion-ignore-case nil)
  (setq company-dabbrev-downcase nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (setq company-backends (delete 'company-semantic company-backends)))


(use-package company-quickhelp
  :config
  (add-hook 'global-company-mode #'company-quickhelp-mode))


(use-package smex
  :defer t)
 
(provide 'init-company)
;;; init-company.el ends here
