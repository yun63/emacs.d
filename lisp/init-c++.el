;;; init-c++.el --- Project config for c/c++ language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;(use-package irony
;;  :defer 2
;;  :hook ((c++-mode . irony-mode)
;;         (c-mode . irony-mode))
;;  :config
;;  (progn
;;    (unless (irony--find-server-executable) (call-interactively #'irony-install-server))
;;    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;  )
;;
;;  (use-package company-irony-c-headers
;;    :ensure t)
;;
;;  (use-package company-irony
;;    :ensure t
;;    :config
;;    (add-to-list (make-local-variable 'company-backends) '(company-irony company-irony-c-headers)))
;;
;;  (use-package flycheck-irony
;;    :ensure t
;;    :config
;;    (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))
;;
;;  (use-package irony-eldoc
;;    :ensure t
;;    :config
;;    (add-hook 'irony-mode-hook #'irony-eldoc))
;;  )
;;
;;(use-package rtags
;;  :after irony
;;  :defer t)

(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) . (lambda () (require 'ccls) (lsp)))
  :config
  (setq ccls-executable "/usr/local/bin/ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc)))


;; modern c++
(use-package modern-cpp-font-lock
  :defer 2
  :hook (c++-mode . modern-c++-font-lock-mode))

(use-package clang-format
  :config
  (global-set-key (kbd "C-c C-f") 'clang-format-region))


(provide 'init-c++)
;;; init-c++.el ends here
