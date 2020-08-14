;;; init-yasnippet.el ---  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package yasnippet
  :defer t
  :commands (yas-expand-snippet)
  :config
  (yas-global-mode 1)
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets")))


(defun autoinsert-yas-expand ()
  "Replace text in yasnippet template."
  (yas-expand-snippet (buffer-string) (point-min) (point-max)))


;; autoinsert
(use-package autoinsert
  :config
  (setq auto-insert-query nil)
  (setq auto-insert-directory (locate-user-emacs-file "templates"))
  (add-hook 'find-file-hook 'auto-insert)
  (define-auto-insert "\\.h$" [ "yas-template-header-c-c++" autoinsert-yas-expand ])
  (define-auto-insert "\\.c$" [ "yas-template-c-c++" autoinsert-yas-expand ])
  (define-auto-insert "\\.cpp$" [ "yas-template-c-c++" autoinsert-yas-expand ])
  (define-auto-insert "\\.java" [ "yas-template-java" autoinsert-yas-expand ])
  (define-auto-insert "\\.py$" [ "yas-template-py" autoinsert-yas-expand ])
  (define-auto-insert "\\.go$" [ "yas-template-go" autoinsert-yas-expand ])
  (define-auto-insert "\\.proto$" [ "yas-template-protobuf" autoinsert-yas-expand ])
  (auto-insert-mode 1))


(provide 'init-yasnippet)
;;; init-yasnippet ends here
