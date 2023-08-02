;;; init-eglot.el --- A Emacs LSP client for auto complete -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package eglot
  :config
  ;; reference: http://man6.org/blog/Emacs/eglot%E9%85%8D%E7%BD%AE.md
  ;; c-mode, c++-mode配置使用clangd作为LSP后端
  (setq read-process-output-max (* 1024 1024))
  (eldoc-mode -1)
  (add-to-list 'eglot-server-programs '((c-mode c++-mode) "clangd-13"))
  ;; 使用c-mode/c++-mode开启eglog
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure))


(provide 'init-eglot)
;;; init-eglot.el ends here
