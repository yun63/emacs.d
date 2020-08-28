;;; init-c++.el --- Project config for c/c++ language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package irony
  :hook
  (c-mode . irony-mode)
  (c++-mode . irony-mode)
  (iron-mode . irony-cdb-autosetup-compile-options))

(use-package company-irony
  :config
  (add-to-list 'company-backends '(company-irony company-irony-c-headers)))

(use-package company-irony-c-headers
  :ensure t)

(use-package flycheck-irony
  :config
  (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))

(use-package irony-eldoc
  :config
  (add-hook 'irony-mode-hook #'irony-eldoc))

(defun my-irony-mode-hook ()
    "Irony mode hook."
    (define-key irony-mode-map [remap completion-at-point] 'counsel-irony)
    (define-key irony-mode-map [remap complete-symbol] 'counsel-irony))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)

(use-package rtags
  :defer t
  :config
  (rtags-enable-standard-keybindings)
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (define-key c-mode-base-map (kbd "M-.") (function rtags-find-symbol-at-point))
  (define-key c-mode-base-map (kbd "M-,") (function rtags-find-references-at-point)))

;;(use-package cmake-ide
;;  :config
;;  (cmake-ide-setup))

;;(use-package auto-complete-c-headers
;;  :defer t
;;  :config
;;  (add-hook 'c-mode-hook   (lambda ()
;;                             (add-to-list 'ac-sources 'ac-source-c-headers)))
;;  (add-hook 'c++-mode-hook (lambda ()
;;                             (add-to-list 'ac-sources 'ac-source-c-headers))))

(use-package company-irony-c-headers
  :defer t
  :config
  (progn (add-hook 'c-mode-hook
                   (lambda () (add-to-list 'company-backends 'company-irony-c-headers)))
         (add-hook 'c++-mode-hook
                   (lambda () (add-to-list 'company-backends 'company-irony-c-headers)))))

;; modern c++
(use-package modern-cpp-font-lock
  :defer 2
  :config
  (modern-c++-font-lock-global-mode t))

(use-package clang-format
  :config
  (global-set-key (kbd "C-c C-f") 'clang-format-region))

(use-package cmake-mode
  :mode ("CMakeLists\\.txt$" . cmake-mode)
  :config
  (add-hook 'cmake-mode-hook (lambda()
                               (add-to-list (make-local-variable 'company-backends)
                                            'company-cmake))))

(defconst my-cc-style
  '("cc-mode"
    (c-offsets-alist . ((innamespace . [0])))))

(c-add-style "my-cc-mode" my-cc-style)

(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "my-cc-mode")))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(provide 'init-c++)
;;; init-c++.el ends here
