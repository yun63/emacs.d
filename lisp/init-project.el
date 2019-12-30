;;; init-project.el --- Project config for some languages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package irony
  :ensure t
  :config
  (progn
    (unless (irony--find-server-executable) (call-interactively #'irony-install-server))
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
  )

(use-package company-c-headers
  :ensure t)

(use-package company-irony
  :requires (company irony)
  :config
  (progn
    (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))))

(use-package flycheck-irony
  :requires (flycheck irony)
  :hook (flycheck-mode . flycheck-irony-setup))

(use-package irony-eldoc
  :requires (eldoc irony)
  :hook (irony-mode . irony-eldoc))

;; company-c-headers
(use-package company-c-headers
  :ensure t)

(provide 'init-project)
;;; init-project.el ends here
