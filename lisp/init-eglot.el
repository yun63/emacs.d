;;; init-eglot.el --- A Emacs LSP client for auto complete -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package eglot
  :config
  ;; reference: http://man6.org/blog/Emacs/eglot%E9%85%8D%E7%BD%AE.md
  ;; c-mode, c++-mode配置使用clangd作为LSP后端
  (add-to-list 'eglot-server-programs '((c-mode c++-mode) "clangd-14"))
  ;; 使用c-mode/c++-mode开启eglog
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure))


(provide 'init-eglot)
;;; init-eglot.el ends here
