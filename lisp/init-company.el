;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(use-package company
  :ensure t
  :init
  (setq tab-always-indent 'complete)
  (add-to-list 'completion-styles 'initials t)
;;;  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (setq-default company-dabbrev-other-buffers 'all
		company-tooltip-align-annotations t)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (use-package company-quickhelp
    :ensure t
    :init (add-hook 'global-company-mode #'company-quickhelp-mode))
  )

(use-package smex
  :ensure t
  :bind (("M-x" . smex))
  :config (smex-initialize))

(provide 'init-company)
;;; init-company.el ends here
