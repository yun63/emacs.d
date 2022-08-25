;;; init-c++.el --- Project config for c/c++ language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;(use-package irony
;;  :hook
;;  (c-mode . irony-mode)
;;  (c++-mode . irony-mode)
;;  (irony-mode . irony-cdb-autosetup-compile-options)
;;  :config
;;  (setq-default c-default-style "linux")
;;  (setq irony--compile-options '("-std=c++11"
;;                                 "-stdlib=libc++"
;;                                 "-I/usr/include/c++/11")))
;;
;;(use-package company-irony
;;  :config
;;  (setq company-irony-ignore-case 'smart)
;;  (add-to-list 'company-backends '(company-irony company-irony-c-headers)))

;;(use-package company-irony-c-headers
;;  :ensure t)
;;
;;(defun my-irony-mode-hook ()
;;    "Irony mode hook."
;;    (define-key irony-mode-map [remap completion-at-point] 'counsel-irony)
;;    (define-key irony-mode-map [remap complete-symbol] 'counsel-irony))
;;
;;(add-hook 'irony-mode-hook 'my-irony-mode-hook)
;;

;;(use-package company-irony-c-headers
;;  :defer t
;;  :config
;;  (progn (add-hook 'c-mode-hook
;;                   (lambda () (add-to-list 'company-backends 'company-irony-c-headers)))
;;         (add-hook 'c++-mode-hook
;;                   (lambda () (add-to-list 'company-backends 'company-irony-c-headers)))))
;;

(use-package company-c-headers
  :init
  (setq company-backends (delete 'company-semantic company-backends))
  (add-to-list 'company-backends 'company-c-headers))

(add-to-list 'company-c-headers-path-system "/usr/include/c++/11")

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

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

(defun my-c-mode-common-hook-setup ()
    (setq cc-search-directories '("." "/usr/include" "/usr/local/include/*" "../*/include")))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook-setup)

(provide 'init-c++)
;;; init-c++.el ends here
