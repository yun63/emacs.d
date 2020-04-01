;;; init-evil.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package evil
  :init
  (evil-mode 1)
  :config
  (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
  (define-key evil-insert-state-map (kbd "C-k") 'kill-line))


(local-require 'general)
(general-evil-setup t)


;; Use `,` as leader key
(general-create-definer local-leader-def
  :prefix ","
  :states '(normal visual))

(local-leader-def
  "d"  'dired
  "f"  'find-file-in-project
  "h"  'split-window-horizontally
  "v"  'split-window-vertically
  "m"  'evil-set-marker
  "g"  'counsel-ag
  "p"  'projectile-switch-project
  "q"  'delete-other-window
  "s"  'counsel-grep ; grep current buffer
  "be" 'ivy-switch-buffer
  "xd" 'dired-jump ; open the dired from current buffer
  "xk" 'kill-buffer
  "bb" (lambda () (interactive) (switch-to-buffer nil))) ; switch to previous buffer

;; Use `SPC` as leader key
(general-create-definer space-leader-def
  :prefix "SPC"
  :states '(normal visual))

(space-leader-def
  "kk" 'scroll-other-window
  "jj" 'scroll-other-window-down
  "pw" 'pwd
  "pf" 'profiler-start)


(provide 'init-evil)
;;; init-evil.el ends here
