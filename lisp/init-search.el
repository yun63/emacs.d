;;; init-search.el --- search tools settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package vertico
  :custom
  (vertico-scroll-margin 2) ;; Different scroll margin
  (vertico-count 20) ;; Show more candidates
  (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode)
  :config
  (define-key vertico-map (kbd "C-p") 'vertico-previous)
  (define-key vertico-map (kbd "C-n") 'vertico-next))

(use-package orderless
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package consult
  :init
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0.1)
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  (setq consult-preview-key 'any)
  ;;(setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-function (lambda (_) (projectile-project-root)))

  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep consult-man
   consult-bookmark consult-recent-file consult-xref
   consult-source-bookmark consult-source-file-register
   consult-source-recent-file consult-source-project-recent-file
   :preview-key '(:debounce 0.2 any))
  (setq consult-narrow-key "<")

  (defun consult-project-search (&optional initial)
    "项目文本搜索函数（兼容 Projectile/纯 Git/非 Git 目录）"
    (interactive)
    ;; 检查 ripgrep 是否安装（避免无意义报错）
    (unless (executable-find "rg")
      (error "请先安装 ripgrep：brew install ripgrep (Mac) / sudo apt install ripgrep (Linux)"))
    ;; 获取项目根目录（优先 Projectile → Git → 当前目录）
    (let* (
           (project-root (condition-case nil
                             (projectile-project-root)
                           (error nil)))
           (project-root (or project-root
                             (locate-dominating-file default-directory ".git")
                             default-directory))
           (project-root (expand-file-name project-root))
           (consult-ripgrep-program (executable-find "rg")))
      ;; 调用 consult-ripgrep 触发搜索（核心：生成候选列表）
      (consult-ripgrep project-root initial))))

(provide 'init-search)
;;; init-search.el ends here
