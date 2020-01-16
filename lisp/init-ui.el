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


;;(use-package dashboard
;;  :config
;;  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;;  (setq dashboard-show-shortcuts nil)
;;  (setq dashboard-items '((projects . 3)
;;                          (agenda . 5)))
;;  (setq page-break-lines-char ?-)
;;  (setq dashboard-set-navigator t)
;;  (setq show-week-agenda-p t)
;;  (setq dashboard-org-agenda-categories '("Tasks" "Appointments"))
;;  (dashboard-setup-startup-hook))

(use-package treemacs
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)


(use-package neotree
  :defer 2
  :config
  (evil-leader/set-key "m"  'neotree-toggle)
  (evil-leader/set-key "n"  'neotree-project-dir)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
      (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
      (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
      (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
      (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

      (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
      (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)

      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))


(use-package doom-themes
  :hook (after-init . icon-mode)
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  ;;(load-theme 'doom-one t)
  (load-theme 'spacemacs-dark t)
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

  (use-package rainbow-delimiters
    :defer 2
    :hook (prog-mode . rainbow-delimiters-mode))

  (use-package beacon
    :defer 2
    :hook (after-init . beacon-mode)
    :config
    (setq-default beacon-lighter " ")
    (setq-default beacon-size 20))

  (use-package autopair
    :hook (prog-mode . autopair-global-mode)
    :config
    (setq autopair-blink nil))
  )


(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (set-face-attribute 'mode-line           nil :background "grey22")
  (setq doom-modeline-height 25)
  (setq doom-modeline-project-detection 'project)
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (setq doom-modeline-icon (display-graphic-p))
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-modification-icon t)
  (setq doom-modeline-unicode-fallback t)
  (setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
  (setq doom-modeline-buffer-encoding t)
  (setq doom-modeline-number-limit 99)
  (setq doom-modeline-persp-name t)
  (setq doom-modeline-github t)
  (setq doom-modeline-github-interval (* 30 60))
  (setq doom-modeline-env-version t)
  )

;;(use-package spacemacs-theme
;;    :defer 2
;;    :init
;;    (load-theme 'spacemacs-dark t)
;;    
;;    (use-package rainbow-delimiters
;;      :defer 2
;;      :hook (prog-mode . rainbow-delimiters-mode))
;;
;;    (use-package beacon
;;      :defer 2
;;      :hook (after-init . beacon-mode)
;;      :config
;;      (setq-default beacon-lighter " ")
;;      (setq-default beacon-size 20))
;;
;;    (use-package autopair
;;      :hook (prog-mode . autopair-global-mode)
;;      :config
;;      (setq autopair-blink nil))
;;    )


;;(use-package telephone-line
;;    :config
;;    (set-face-attribute 'mode-line           nil :background "grey22")
;;
;;    (setq telephone-line-primary-left-separator 'telephone-line-gradient
;;          telephone-line-secondary-left-separator 'telephone-line-nil
;;          telephone-line-primary-right-separator 'telephone-line-gradient
;;          telephone-line-secondary-right-separator 'telephone-line-nil)
;;    
;;    (setq telephone-line-height 24
;;          telephone-line-evil-use-short-tag nil)
;;    
;;    (setq telephone-line-lhs
;;          '((evil   . (telephone-line-evil-tag-segment))
;;            (nil    . (telephone-line-erc-modified-channels-segment
;;                       telephone-line-process-segment))
;;            (nil    . (telephone-line-buffer-segment))))
;;
;;    (setq telephone-line-rhs
;;          '((nil    . (telephone-line-misc-info-segment))
;;            (nil    . (telephone-line-atom-encoding-segment))
;;            (nil    . (telephone-line-major-mode-segment))
;;            (nil    . (telephone-line-vc-segment))
;;            (evil   . (telephone-line-airline-position-segment))))
;;    (telephone-line-mode 1))


(use-package dimmer
  :defer 2
  :config
  (dimmer-configure-which-key)
  (dimmer-configure-helm)
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
    (after-load 'page-break-lines
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
