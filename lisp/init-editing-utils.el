;;; init-editing-utils.el --- Day-to-day editing helpers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;(require-package 'unfill)

(use-package unfill
  :defer 2)

(when (fboundp 'electric-pair-mode)
  (add-hook 'after-init-hook 'electric-pair-mode))
(when (eval-when-compile (version< "24.4" emacs-version))
  (add-hook 'after-init-hook 'electric-indent-mode))

(use-package list-unicode-display
  :defer 2)

(setq-default
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 300
 case-fold-search t
;; column-number-mode t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
;; make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

(add-hook 'after-init-hook 'global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)
(after-load 'autorevert
  (diminish 'auto-revert-mode))

(add-hook 'after-init-hook 'transient-mark-mode)


;;
;; Huge files
(use-package vlf
  :defer 2)


(defun ffap-vlf ()
  "Find file at point with VLF."
  (interactive)
  (let ((file (ffap-file-at-point)))
    (unless (file-exists-p file)
      (error "File does not exist: %s" file))
    (vlf file)))


;; A simple visible bell which works in all terminal types
(use-package mode-line-bell
  :hook (after-init . mode-line-bell-mode))


(use-package beacon
  :hook (after-init . beacon-mode)
  :config
  (setq-default beacon-lighter "")
  (setq-default beacon-size 20))


;; Newline behaviour
(global-set-key (kbd "RET") 'newline-and-indent)
(defun newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "S-<return>") 'newline-at-end-of-line)



(after-load 'subword
  (diminish 'subword-mode))



;;(when (fboundp 'display-line-numbers-mode)
;;  (setq-default display-line-numbers-width 3)
;;  (add-hook 'prog-mode-hook 'display-line-numbers-mode))


(when (fboundp 'global-prettify-symbols-mode)
  (add-hook 'after-init-hook 'global-prettify-symbols-mode))


(use-package browse-kill-ring
  :defer 2
  :config
  (setq browse-kill-ring-separator "\f")
  (global-set-key (kbd "M-Y") 'browse-kill-ring)
  (define-key browse-kill-ring-mode-map (kbd "C-g") 'browse-kill-ring-quit)
  (define-key browse-kill-ring-mode-map (kbd "M-n") 'browse-kill-ring-forward)
  (define-key browse-kill-ring-mode-map (kbd "M-p") 'browse-kill-ring-previous)
  (progn
    (after-load 'page-break-lines
      (push 'browse-kill-ring-mode page-break-lines-modes)))
  )

;;;;----------------------------------------------------------------------------
;;;; Show matching parens
;;;;----------------------------------------------------------------------------
;;(add-hook 'after-init-hook 'show-paren-mode)
;;
;;(require-package 'expand-region)
;;(global-set-key (kbd "C-=") 'er/expand-region)
;;
;;
;;;;----------------------------------------------------------------------------
;;;; Don't disable case-change functions
;;;;----------------------------------------------------------------------------
;;(put 'upcase-region 'disabled nil)
;;(put 'downcase-region 'disabled nil)
;;
;;
;;(require-package 'multiple-cursors)
;;;; multiple-cursors
;;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;(global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;(global-set-key (kbd "C-+") 'mc/mark-next-like-this)
;;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;;;; From active region to multiple cursors:
;;(global-set-key (kbd "C-c m r") 'set-rectangular-region-anchor)
;;(global-set-key (kbd "C-c m c") 'mc/edit-lines)
;;(global-set-key (kbd "C-c m e") 'mc/edit-ends-of-lines)
;;(global-set-key (kbd "C-c m a") 'mc/edit-beginnings-of-lines)
;;
;;
(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)
;;
;;
;;;;----------------------------------------------------------------------------
;;;; Page break lines
;;;;----------------------------------------------------------------------------
;;(when (maybe-require-package 'page-break-lines)
;;  (add-hook 'after-init-hook 'global-page-break-lines-mode)
;;  (after-load 'page-break-lines
;;    (diminish 'page-break-lines-mode)))
;;
;;;;----------------------------------------------------------------------------
;;;; Shift lines up and down with M-up and M-down. When paredit is enabled,
;;;; it will use those keybindings. For this reason, you might prefer to
;;;; use M-S-up and M-S-down, which will work even in lisp modes.
;;;;----------------------------------------------------------------------------
;;(require-package 'move-dup)
;;(global-set-key [M-up] 'md-move-lines-up)
;;(global-set-key [M-down] 'md-move-lines-down)
;;(global-set-key [M-S-up] 'md-move-lines-up)
;;(global-set-key [M-S-down] 'md-move-lines-down)
;;
;;(global-set-key (kbd "C-c d") 'md-duplicate-down)
;;(global-set-key (kbd "C-c u") 'md-duplicate-up)
;;
;;
;;
;;(require-package 'highlight-escape-sequences)
;;(add-hook 'after-init-hook 'hes-mode)
;;
;;
;;(require-package 'which-key)
;;(add-hook 'after-init-hook 'which-key-mode)
;;(setq-default which-key-idle-delay 1.5)
;;(after-load 'which-key
;;  (diminish 'which-key-mode))
;;
;;

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
