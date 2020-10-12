;;; init-lsp.el --- Language Server Protocol Support for Emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :commands lsp
  :hook
  (c-mode .lsp)
  (c++-mode . lsp)
  (python-mode .lsp)
  :config
  (lsp-mode))

;; optionally
(use-package lsp-ui
  :defer t
  :commands (lsp-ui-mode lsp-ui-doc-mode)
  :config
  (lsp-ui-mode)
  (lsp-ui-doc-mode))


(use-package company-lsp
  :ensure t)


(use-package lsp-ivy
  :defer t
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :defer t
  :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode
  :defer t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(provide 'init-lsp)
;;; init-lsp.el ends here
