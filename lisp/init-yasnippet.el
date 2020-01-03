;; -*- coding: utf-8; lexical-binding: t; -*-

(use-package yasnippet
  :defer 2
  :config
  (yas-global-mode 1)
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets")))

(use-package yasnippet-snippets
  :defer 2)

(provide 'init-yasnippet)
