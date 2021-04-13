;;; init-evil.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package evil
  :init
  (evil-mode 1)
  :config
  (defalias 'forward-evil-word 'forward-evil-symbol)
  (setq evil-ex-search-case 'sensitive)
  (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
  (define-key evil-insert-state-map (kbd "C-u") 'kill-back-to-indentation)
  (define-key evil-normal-state-map (kbd "C-u") 'kill-back-to-indentation)
  (define-key evil-insert-state-map (kbd "C-k") 'kill-line))


(local-require 'general)
(general-evil-setup t)


;; Use `,` as leader key
(general-create-definer local-leader-def
  :prefix ","
  :states '(normal visual emacs))

(local-leader-def
  "d"  'dired
  "f"  'find-file-in-project
  "h"  'split-window-horizontally
  "v"  'split-window-vertically
  "m"  'evil-set-marker
  "g"  'counsel-ag
  "o"  'neotree-toggle
  "p"  'projectile-switch-project
  "q"  'delete-other-windows
  "r"  'counsel-M-x
  "s"  'counsel-grep
  "be" 'ivy-switch-buffer
  "xd" 'dired-jump
  "xf" 'counsel-find-file
  "xk" 'kill-buffer
  "wh" 'evil-window-left
  "wl" 'evil-window-right
  "wj" 'evil-window-up
  "wk" 'evil-window-bottom
  "ws" 'evil-window-split
  "wc" 'evil-window-new
  "bb" (lambda () (interactive) (switch-to-buffer nil)))

;; Use `SPC` as leader key
(general-create-definer space-leader-def
  :prefix "SPC"
  :states '(normal visual emacs))

(space-leader-def
  "kk" 'scroll-other-window
  "jj" 'scroll-other-window-down
  "pw" 'pwd
  "pf" 'profiler-start)


(provide 'init-evil)
;;; init-evil.el ends here
