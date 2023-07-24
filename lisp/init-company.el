;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(use-package company
 :hook
 (after-init . global-company-mode)
 :config
 (setq tab-always-indent 'complete)  ;; use 't when company is disabled
 (add-to-list 'completion-styles 'initials t)
 (setq company-dabbrev-downcase nil
       company-selection-wrap-around t
       company-dabbrev-ignore-case nil
       company-show-numbers t
       company-idle-delay 0.1
       company-require-match nil
       company-tooltip-align-annotations t
       company-minimum-prefix-length 3
       company-auto-complete nil
       completion-ignore-case nil
       company-auto-commit t)

 (setq company-global-modes
       '(not
         eshell-mode
         comint-mode
         erc-mode
         gud-mode
         rcirc-mode
         minibuffer-inactive-mode))

 ;; characters "/ ) . , ;"to trigger auto commit
 (setq company-auto-commit-chars '(92  41 46 44 59))
 (push 'company-cmake company-backends)
 (push 'company-c-headers company-backends)

 ;;(setq company-backends (delete 'company-capf company-backends))
 (setq-default company-backends '((company-capf company-dabbrev-code) company-dabbrev)
                 company-dabbrev-other-buffers 'all)

 (setq company-backends '((company-capf :with company-yasnippet company-tempo)))

 (setq company-auto-complete nil)

 (define-key company-active-map (kbd "C-n") 'company-select-next)
 (define-key company-active-map (kbd "C-p") 'company-select-previous))


(use-package company-quickhelp
  :config
  (add-hook 'global-company-mode #'company-quickhelp-mode))

(use-package company-statistics
  :config
  (company-statistics-mode t))


(use-package smex
  :defer t)

(use-package corfu
  :init
  (global-corfu-mode)
  :config
  (setq-local corfu-auto t
              corfu-auto-delay 0
              corfu-auto-prefix 0
              completion-styles '(basic)))
 
(provide 'init-company)
;;; init-company.el ends here
