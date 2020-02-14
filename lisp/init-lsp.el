;;; init-lsp.el --- Language Server Protocol Support for Emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  ;;:commands (lsp lsp-deferred)
  :commands lsp
  :hook
  ;;(c-mode .lsp-deferred)
  (c-mode .lsp)
  (c++-mode . lsp)
  (python-mode .lsp)
  (prog-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  :init
  (setq lsp-keymap-prefix "C-l")
  :config
  (setq lsp-idle-delay 0.200)
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))

  (lsp-mode))

;; optionally
(use-package lsp-ui
  :defer t
  :commands (lsp-ui-mode lsp-ui-doc-mode)
  :config
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-sideline-show-symbol t)
  (lsp-ui-mode)
  (lsp-ui-doc-mode))


(use-package company-lsp
  :commands company-lsp
  :config
  (push 'company-lsp company-backends))


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
