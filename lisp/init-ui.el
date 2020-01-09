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

;; 设置显示光标所在行列号
(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)
(setq linum-format "%4d ")

;; 显示匹配括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 以y/n代表yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 滚动页面
(setq scroll-step 1)
(setq scroll-margin 3)
(setq scroll-conservatively 10000)

;; 在标题栏显示buffer的名称，默认不显示
(setq frame-title-format "%b@emacs")

;; 支持emacs和外部程序的黏贴
(setq x-select-enable-clipboard t)

;; 备份策略
(setq make-backup-files t)
(setq backup-directory-alist '(("." . "~/.saves")))

;; 关闭自动保存模式
(setq auto-save-mode nil)

;; 不生成#filename#临时文件
(setq auto-save-default nil)

;; 自动的在文件末尾增加一新行
(setq require-final-newline t)

;; 当光标在行尾上下移动的时候，始终保持在行尾
(setq track-eol t)

;; 在模式栏中显示当前光标所在函数
(which-func-mode)

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


(use-package dashboard
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-items '((projects . 3)
                          (agenda . 5)))
  (setq page-break-lines-char ?-)
  (setq dashboard-set-navigator t)
  (setq show-week-agenda-p t)
  (setq dashboard-org-agenda-categories '("Tasks" "Appointments"))
  (dashboard-setup-startup-hook))


(use-package spacemacs-theme
    :defer 2
    :init
    (load-theme 'spacemacs-dark t)
    
    (use-package rainbow-delimiters
      :defer 2
      :hook (prog-mode . rainbow-delimiters-mode))

    (use-package autopair
      :hook (prog-mode . autopair-global-mode)
      :config
      (setq autopair-blink nil))
    )


(use-package telephone-line
    :config
    (set-face-attribute 'mode-line           nil :background "grey22")

    (setq telephone-line-primary-left-separator 'telephone-line-gradient
          telephone-line-secondary-left-separator 'telephone-line-nil
          telephone-line-primary-right-separator 'telephone-line-gradient
          telephone-line-secondary-right-separator 'telephone-line-nil)
    
    (setq telephone-line-height 24
          telephone-line-evil-use-short-tag nil)
    
    (setq telephone-line-lhs
          '((evil   . (telephone-line-evil-tag-segment))
            (accent . (telephone-line-erc-modified-channels-segment
                       telephone-line-process-segment))
            (accent . (telephone-line-buffer-segment))))

    (setq telephone-line-rhs
          '((nil    . (telephone-line-misc-info-segment))
            (accent . (telephone-line-atom-encoding-segment))
            (accent . (telephone-line-major-mode-segment))
            (accent . (telephone-line-vc-segment))
            (evil   . (telephone-line-airline-position-segment))))
    (telephone-line-mode 1))


(use-package dimmer
  :defer 2
  :config
  (dimmer-configure-which-key)
  (dimmer-configure-helm)
  (dimmer-mode t))


(provide 'init-ui)
;;; init-ui.el ends here
