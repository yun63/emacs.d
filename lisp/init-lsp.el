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
  (setq lsp-idle-delay 0.3)
  (setq lsp-prefer-flymake nil)
  (setq lsp-enable-file-watchers nil)
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
  :ensure t
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

(provide 'init-lsp)
;;; init-lsp.el ends here
