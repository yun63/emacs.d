;;; init-c++.el --- Project config for c/c++ language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;(use-package irony
;;  :defer 2
;;  :hook ((c++-mode . irony-mode)
;;         (c-mode . irony-mode))
;;  :config
;;  (progn
;;    (unless (irony--find-server-executable) (call-interactively #'irony-install-server))
;;    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;  )
;;
;;  (use-package company-irony-c-headers
;;    :ensure t)
;;
;;  (use-package company-irony
;;    :ensure t
;;    :config
;;    (add-to-list (make-local-variable 'company-backends) '(company-irony company-irony-c-headers)))
;;
;;  (use-package flycheck-irony
;;    :ensure t
;;    :config
;;    (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))
;;
;;  (use-package irony-eldoc
;;    :ensure t
;;    :config
;;    (add-hook 'irony-mode-hook #'irony-eldoc))
;;  )
;;
;;(use-package rtags
;;  :after irony
;;  :defer t)

(use-package ycmd
  :hook
  (c-mode . ycmd-mode)
  (c++-mode . ycmd-mode)
  :config
  (set-variable 'ycmd-server-command '("python3" "/Users/Yaner/.ycmd/ycmd"))
  (set-variable 'ycmd-global-config "/Users/Yaner/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"))

(use-package company-ycmd
  :hook
  (c++-mode-hook . company-mode)
  :commands company-ycmd-setup
  :config
  (company-ycmd-setup))

(use-package auto-complete-c-headers
  :defer t
  :config
  (add-hook 'c-mode-hook   (lambda ()
                             (add-to-list 'ac-sources 'ac-source-c-headers)))
  (add-hook 'c++-mode-hook (lambda ()
                             (add-to-list 'ac-sources 'ac-source-c-headers)
                             (add-to-list 'achead:include-directories '"/usr/local/include/c++/9.2.0"))))

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
