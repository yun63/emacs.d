;;; init-org.el --- Summary Some cool org2nikola tricks -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:


(use-package org
  :defer t
  :mode ("\\.org$" . org-mode)
  :config
  (setq org-startup-indented nil)
  (setq org-log-done t)

  (setq org-todo-keywords
        '((sequence "TODO(p!)" "进行中(t!)" "阻塞中(s!)" "|" "已完成(d!)" "已取消(a@/!)")))

  (setq org-todo-keyword-faces
        '(("TODO" .   (:foreground "red" :weight bold))
          ("进行中" . (:foreground "orange" :weight bold))
          ("阻塞中" . (:foreground "red" :weight bold))
          ("已完成" . (:foreground "green" :weight bold))
          ("已取消" . (:background "gray" :foreground "black"))))
  (setq org-indent-mode nil)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-show-all))))

(use-package org-bullets
  :config
  (progn
    (setq org-bullets-bullet-list '("◉" "✚" "✿" "❀" "☯"))
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))

(use-package org-super-agenda
  :config
  (add-hook 'org-mode-hook
            (lambda ()
              (org-super-agenda-mode))))

(if (display-graphic-p)
     (progn
       (use-package org-beautify-theme
         :config
         (load-theme 'org-beautify t))))

(provide 'init-org)
;;; init-org.el ends here
