;;; init-project.el --- Project config for some languages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package irony
  :defer 2
  :config
  (progn
    (unless (irony--find-server-executable) (call-interactively #'irony-install-server))
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
  )

(use-package company-c-headers
  :defer 2)

(use-package company-irony
  :requires (company irony)
  :defer 2
  :config
  (progn
    (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))))

(use-package flycheck-irony
  :requires (flycheck irony)
  :defer 2
  :hook (flycheck-mode . flycheck-irony-setup))

(use-package irony-eldoc
  :requires (eldoc irony)
  :defer 2
  :hook (irony-mode . irony-eldoc))

;; company-c-headers
(use-package company-c-headers
  :defer 2)

;; modern c++
(use-package modern-cpp-font-lock
  :defer 2
  :hook (c++-mode . modern-c++-font-lock-mode))

(use-package clang-format
  :config
  (global-set-key (kbd "C-c C-f") 'clang-format-region))


(provide 'init-project)
;;; init-project.el ends here
