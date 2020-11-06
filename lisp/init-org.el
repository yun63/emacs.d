;;; init-org.el --- Summary Some cool org2nikola tricks -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:


(use-package org
  :defer t
  :mode ("\\.org$" . org-mode)
  :config
  (setq org-startup-indented t)

  (setq org-log-done t
        org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE" "CANCELED"))
        org-todo-keyword-faces
        '(("INPROGRESS" . (:foreground "blue" :weight bold))
           ("TODO" . (:foreground "yellow" :weight bold))
           ("DONE" . (:foreground "green" :weight bold))
           ("CANCELED" . (:foreground "red" :weight bold))))

  (add-hook 'org-mode-hook
          (lambda ()
            (goodwrite-mode))))

(use-package org-bullets
  :config
  (progn
    (setq org-bullets-bullet-list '("☯" "✿" "✚" "◉" "❀"))
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))

(provide 'init-org)
;;; init-org.el ends here
