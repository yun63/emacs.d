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
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

;; 设置光标不闪烁
(blink-cursor-mode 0)
(setq-default cursor-type 'bar)

;; 设置显示光标所在行列号
(line-number-mode t)
(column-number-mode t)
(setq linum-format "%05d")

(setq dired-use-ls-dired nil)

;; 显示匹配括号
(show-paren-mode t)

;; 以y/n代表yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 在标题栏显示buffer的名称，默认不显示
(setq frame-title-format "%b@Emacs")

;; 支持emacs和外部程序的黏贴
(setq select-enable-clipboard t)

;; 备份策略
(setq make-backup-files nil)
(setq backup-directory-alist '(("." . "~/.saves")))

;; 关闭自动保存模式
;; 不生成#filename#临时文件
(setq auto-save-default nil)
(setq make-backup-files nil)

;; 自动的在文件末尾增加一新行
(setq require-final-newline t)

;; 当光标在行尾上下移动的时候，始终保持在行尾
;; (setq track-eol t)

;; 禁用启动信息
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)

;; 隐藏工具栏
(tool-bar-mode -1)
(menu-bar-mode -1)

(if (display-graphic-p)
    (progn
      (scroll-bar-mode -1)))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; 语法高亮
(global-font-lock-mode t)
;; 高亮显示选中的区域
(transient-mark-mode t)

(superword-mode t)

(setq echo-keystrokes 0.1)

;; 防止删掉重要的内容
(setq kill-ring-max 200)

;; 删除文件移动到回收站
(setq delete-by-moving-to-trash t)

(setq line-move-visual nil)


(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(setq-default bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory))

(global-display-line-numbers-mode t)

(use-package highlight-numbers
  :defer 2
  :config
  (highlight-numbers-mode))

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

;; Huge files
(use-package vlf
  :defer 2)

;; A simple visible bell which works in all terminal types
(use-package mode-line-bell
  :hook (after-init . mode-line-bell-mode))

;; Newline behaviour
(global-set-key (kbd "RET") 'newline-and-indent)

(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(global-set-key (kbd "C-<backspace>") 'kill-back-to-indentation)

(provide 'init-ui)

;;; init-ui.el ends here
