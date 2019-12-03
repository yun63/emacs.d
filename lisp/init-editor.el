;;; init-editor.el --- Conguration for Emacs editor behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; 写文件编码格式
(set-buffer-file-coding-system 'utf-8)
;;; 新建文件编码方式
(setq-default buffer-file-coding-system 'utf-8)
;;; 终端编码方式
(set-terminal-coding-system 'utf-8)
;;; 键盘输入的编码方式
(set-keyboard-coding-system 'utf-8)
;;; 读取或者写入文件名的编码方式
(setq file-name-coding-system 'utf-8)

;;; 设置tab宽度
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-offset 4)
;;; 设置光标不闪烁
(blink-cursor-mode 1)
(setq-default cursor-type 'bar)
;;; 设置显示光标所在行列号
(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)
(setq linum-format "%4d ")
;;; 显示匹配括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;; 以y/n代表yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;;; 滚动页面
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)
;;; 显示时间
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
;;; 高亮当前行
;;;(require 'hl-line)
;;;(global-hl-line-mode t)
;;; 在标题栏显示buffer的名称，默认不显示
(setq frame-title-format "%b@emacs")
;;; 支持emacs和外部程序的黏贴
(setq x-select-enable-clipboard t)
;;; 备份策略
(setq make-backup-files t)
(setq backup-directory-alist '(("." . "~/.saves")))
;;; 关闭自动保存模式
(setq auto-save-mode nil)
;;; 不生成#filename#临时文件
(setq auto-save-default nil)
;;; 自动的在文件末尾增加一新行
(setq require-final-newline t)
;;; 当光标在行尾上下移动的时候，始终保持在行尾
(setq track-eol t)

;;; 在模式栏中显示当前光标所在函数
(which-func-mode)

;;; 禁用启动信息
(setq inhibit-startup-message t)
;;; 隐藏工具栏
(tool-bar-mode nil)
(menu-bar-mode nil)
(mouse-avoidance-mode 'animate)

;;; 语法高亮
(global-font-lock-mode t)
;;; 高亮显示选中的区域
(transient-mark-mode t)

;;; 防止删掉重要的内容
(setq kill-ring-max 200)


(provide 'init-editor)
;;; init-deitor.el ends here
