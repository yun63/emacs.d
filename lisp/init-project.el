;;; init-project.el --- Project config for some languages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package irony
  :ensure t
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  )

;; company-c-headers
(use-package company-c-headers
  :ensure t
  :init
  (add-to-list 'company-backends 'company-c-headers))

(provide 'init-project)
;;; init-project.el ends here
