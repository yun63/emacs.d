;;; init-c++.el --- Project config for c/c++ language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


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
  "C++ mode hook setup."
  (setq cc-search-directories '("." "/usr/include" "/usr/local/include/*" "../*/include")))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook-setup)

(provide 'init-c++)
;;; init-c++.el ends here
