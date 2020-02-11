;;; init-lsp.el --- Language Server Protocol Support for Emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook
  (c-mode .lsp-deferred)
  (c++-mode . lsp-deferred)
  (python-mode .lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration)
  :init
  (lsp-mode)
  (setq lsp-keymap-prefix "C-c l"))

;; optionally
(use-package lsp-ui
  :defer t
  :commands lsp-ui-mode)

(use-package company-lsp
  :defer t
  :commands company-lsp)

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

;; optional if you want which-key integration
(use-package which-key
  :config
  (which-key-mode))

(provide 'init-lsp)
;;; init-lsp.el ends here
