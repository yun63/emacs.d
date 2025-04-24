;;; init-lsp.el --- Language Server Protocol Support for Emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :commands lsp

  :init
  (setq lsp-enable-flymake nil)

  :hook
  (c-mode .lsp)
  (c++-mode . lsp)
  (python-mode .lsp)
  (js-mode .lsp-deferred)

  :config
  (setq lsp-lens-enable t)
  (setq lsp-response-timeout 10)
  (setq lsp-log-io nil)
  (lsp-mode))

(use-package lsp-treemacs
  :defer t
  :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode
  :defer t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(provide 'init-lsp)
;;; init-lsp.el ends here
