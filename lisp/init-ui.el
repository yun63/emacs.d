;;; init-ui.el --- Conguration for Emacs editor faces -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; 写文件编码格式
(set-buffer-file-coding-system 'utf-8)

;; 新建文件编码方式
(setq-default buffer-file-coding-system 'utf-8)

;; 终端编码方式
(set-terminal-coding-system 'utf-8)

;; 键盘输入的编码方式
(set-keyboard-coding-system 'utf-8)

;; 读取或者写入文件名的编码方式
(setq file-name-coding-system 'utf-8)

;; 设置tab宽度
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-offset 4)

;; 设置光标不闪烁
(blink-cursor-mode 1)
(setq-default cursor-type 'bar)
(setq-default blink-cursor-interval 0.4)

;; 设置显示光标所在行列号
(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)
(setq linum-format "%4d ")
(display-line-numbers-mode t)

;; 显示匹配括号
(show-paren-mode t)
;;(setq show-paren-style 'parentheses)

;; 以y/n代表yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 滚动页面
(setq scroll-step 1)
(setq scroll-margin 3)
(setq scroll-conservatively 10000)

;; 在标题栏显示buffer的名称，默认不显示
(setq frame-title-format "%b@emacs")

;; 支持emacs和外部程序的黏贴
(setq select-enable-clipboard t)

;; 备份策略
(setq make-backup-files t)
(setq backup-directory-alist '(("." . "~/.saves")))

;; 关闭自动保存模式
;;(setq auto-save-mode nil)

;; 不生成#filename#临时文件
(setq auto-save-default nil)

;; 自动的在文件末尾增加一新行
(setq require-final-newline t)

;; 当光标在行尾上下移动的时候，始终保持在行尾
(setq track-eol t)

;; 在模式栏中显示当前光标所在函数
;;(which-function-mode)

;; 禁用启动信息
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)

;; 隐藏工具栏
(tool-bar-mode -1)
(menu-bar-mode -1)

;; 语法高亮
(global-font-lock-mode t)
;; 高亮显示选中的区域
(transient-mark-mode t)

;; 防止删掉重要的内容
(setq kill-ring-max 200)

(setq-default bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
              buffers-menu-max-size 300
              case-fold-search t
              delete-selection-mode t
              ediff-split-window-function 'split-window-horizontally
              ediff-window-setup-function 'ediff-setup-windows-plain
              mouse-yank-at-point t
              save-interprogram-paste-before-kill t
              scroll-preserve-screen-position 'always
              set-mark-command-repeat-pop t
              tooltip-delay 1.5
              truncate-lines nil
              truncate-partial-width-windows nil)


(use-package dimmer
  :commands (dimmer-configure-which-key)
  :config
  (dimmer-mode t))

(use-package highlight-escape-sequences
  :defer 2
  :hook (after-init . hes-mode))

(use-package which-key
  :defer 2
  :hook (after-init . which-key-mode)
  :config
  (setq-default which-key-idle-delay 1)
  (diminish 'which-key-mode))

(use-package unfill
  :defer 2)

(use-package list-unicode-display
  :defer 2)

;; Huge files
(use-package vlf
  :defer 2)

;; A simple visible bell which works in all terminal types
(use-package mode-line-bell
  :hook (after-init . mode-line-bell-mode))

(use-package browse-kill-ring
  :defer 2
  :config
  (setq browse-kill-ring-separator "\f")
  (global-set-key (kbd "M-Y") 'browse-kill-ring)
  (define-key browse-kill-ring-mode-map (kbd "C-g") 'browse-kill-ring-quit)
  (define-key browse-kill-ring-mode-map (kbd "M-n") 'browse-kill-ring-forward)
  (define-key browse-kill-ring-mode-map (kbd "M-p") 'browse-kill-ring-previous)
  (progn
    (with-eval-after-load 'page-break-lines
      (push 'browse-kill-ring-mode page-break-lines-modes)))
  )

;; Newline behaviour
(global-set-key (kbd "RET") 'newline-and-indent)

(defun newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "S-<return>") 'newline-at-end-of-line)

(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(global-set-key (kbd "C-<backspace>") 'kill-back-to-indentation)


(provide 'init-ui)

;;; init-ui.el ends here
