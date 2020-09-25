;;; init-org.el --- Summary Some cool org2nikola tricks -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:


(use-package org
  :defer t
  :mode ("\\.org$" . org-mode)
  :config
  (setq org-startup-indented t)

  (setq org-log-done t
        org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
        org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))

  (add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
  (add-hook 'org-mode-hook
          (lambda ()
            (writegood-mode))))

(provide 'init-org)
;;; init-org.el ends here
