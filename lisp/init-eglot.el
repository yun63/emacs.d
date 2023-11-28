;;; init-eglot.el --- A Emacs LSP client for auto complete -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; reference: http://man6.org/blog/Emacs/eglot%E9%85%8D%E7%BD%AE.md
;; c-mode, c++-mode配置使用clangd作为LSP后端
(setq read-process-output-max (* 1024 1024))
;;(add-to-list 'eglot-server-programs '(c-mode "clangd"))
;;(add-to-list 'eglot-server-programs '(c++-mode "clangd"))
;; 使用c-mode/c++-mode开启eglog
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(provide 'init-eglot)
;;; init-eglot.el ends here
