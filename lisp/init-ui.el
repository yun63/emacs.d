;;; init-ui.el --- Conguration for Emacs editor faces -*- lexical-binding: t -*-
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
(setq scroll-step 1)
(setq scroll-margin 3)
(setq scroll-conservatively 10000)
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
(setq inhibit-startup-screen nil)
;;; 隐藏工具栏
(tool-bar-mode -1)
(menu-bar-mode -1)
(mouse-avoidance-mode 'animate)
;;; 语法高亮
(global-font-lock-mode t)
;;; 高亮显示选中的区域
(transient-mark-mode t)
;;; 防止删掉重要的内容
(setq kill-ring-max 200)


;;;Theme
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (setq doom-themes-treemacs-theme "doom-colors")
;;  (load-theme 'doom-molokai t)
  (set-face-foreground 'mode-line (face-foreground 'default))
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config)
  )

(use-package doom-modeline
  :hook (after-init . doom-modeline-init)
  :config
  (setq doom-modeline-height 25)
  (setq doom-modeline-bar-width 3)
  (setq doom-modeline-project-detection 'project)
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (setq doom-modeline-icon (display-graphic-p))
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-modification-icon t)
  (setq doom-modeline-unicode-fallback nil)
  (setq doom-modeline-minor-modes (featurep 'minions))
  (setq doom-modeline-enable-word-count nil)
  (setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
  (setq doom-modeline-buffer-encoding t)
  (setq doom-modeline-indent-info nil)
  (setq doom-modeline-checker-simple-format t)
  (setq doom-modeline-number-limit 99)
  (setq doom-modeline-vcs-max-length 12)
  (setq doom-modeline-persp-name t)
  (setq doom-modeline-display-default-persp-name nil)
  (setq doom-modeline-lsp t)
  (setq doom-modeline-github t)
  )


(use-package page-break-lines
  :defer 2)

(use-package smart-mode-line
  :init
  (setq sml/theme 'dark))
  (setq sml/no-confirm-load-theme t)
  (sml/setup)

(use-package telephone-line
  :init
  (telephone-line-mode 1))

(use-package all-the-icons
  :defer 2
  :if (display-graphic-p)
  :init (unless (or sys/win32p (member "all-the-icons" (font-family-list)))
          (all-the-icons-install-fonts t))
  :config
  (with-no-warnings
    (defun all-the-icons-icon-for-dir (dir &optional chevron padding)
      "Format an icon for DIR with CHEVRON similar to tree based directories."
      (let* ((matcher (all-the-icons-match-to-alist (file-name-base (directory-file-name dir)) all-the-icons-dir-icon-alist))
             (path (expand-file-name dir))
             (chevron (if chevron (all-the-icons-octicon (format "chevron-%s" chevron) :height 0.8 :v-adjust -0.1) ""))
             (padding (or padding "\t"))
             (icon (cond
                    ((file-symlink-p path)
                     (all-the-icons-octicon "file-symlink-directory" :height 1.0 :v-adjust 0.0))
                    ((all-the-icons-dir-is-submodule path)
                     (all-the-icons-octicon "file-submodule" :height 1.0 :v-adjust 0.0))
                    ((file-exists-p (format "%s/.git" path))
                     (format "%s" (all-the-icons-octicon "repo" :height 1.1 :v-adjust 0.0)))
                    (t (apply (car matcher) (list (cadr matcher) :v-adjust 0.0))))))
        (format "%s%s%s%s%s" padding chevron padding icon padding)))

    (defun all-the-icons-reset ()
      "Reset (unmemoize/memoize) the icons."
      (interactive)
      (dolist (f '(all-the-icons-icon-for-file
                   all-the-icons-icon-for-mode
                   all-the-icons-icon-for-url
                   all-the-icons-icon-family-for-file
                   all-the-icons-icon-family-for-mode
                   all-the-icons-icon-family))
        (ignore-errors
          (memoize-restore f)
          (memoize f)))
      (message "Reset all-the-icons")))

  (add-to-list 'all-the-icons-mode-icon-alist
               '(gfm-mode all-the-icons-octicon "markdown" :face all-the-icons-lblue)))


(provide 'init-ui)
;;; init-ui.el ends here
