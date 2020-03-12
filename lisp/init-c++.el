;;; init-c++.el --- Project config for c/c++ language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package irony
  :commands
  (irony-install-server irony--find-server-executable)
  :hook
  (c-mode . irony-mode)
  (c++-mode . irony-mode)
  (irony-mode . irony-cdb-autosetup-compile-options)
  :config
  (unless (irony--find-server-executable) (call-interactively #'irony-install-server)))

(use-package company-irony
  :config
  (add-to-list (make-local-variable 'company-backends) '(company-irony company-irony-c-headers)))

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
  :defer t)

(use-package auto-complete-c-headers
  :defer t
  :config
  (add-hook 'c-mode-hook   (lambda ()
                             (add-to-list 'ac-sources 'ac-source-c-headers)))
  (add-hook 'c++-mode-hook (lambda ()
                             (add-to-list 'ac-sources 'ac-source-c-headers)
                             (add-to-list 'achead:include-directories '"/usr/include/c++/7.4.0"))))

(use-package company-irony-c-headers
  :defer t)

;; modern c++
(use-package modern-cpp-font-lock
  :defer 2
  :config
  (modern-c++-font-lock-global-mode t))

(use-package clang-format
  :config
  (global-set-key (kbd "C-c C-f") 'clang-format-region))

(defconst my-cc-style
  '("cc-mode"
    (c-offsets-alist . ((innamespace . [0])))))

(c-add-style "my-cc-mode" my-cc-style)

(provide 'init-c++)
;;; init-c++.el ends here
