;;; init-helm.el --- helm search tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package helm-rg
  :ensure t)

(use-package helm-gtags
 :init
 (setq helm-gtags-auto-update t)
 (setq helm-gtags-use-input-at-cursor t)
 (setq helm-gtags-prefix-key "\C-cg")
 (setq helm-gtags-suggested-key-mapping t)

 ;; Enable helm-gtags-mode in Dired so you can jump to any tag
 ;; when navigate project tree with Dired
 ;; (add-hook 'dired-mode-hook 'helm-gtags-mode)

 ;; Enable helm-gtags-mode in languages that GNU Global supports
 ;; (add-hook 'c-mode-hook 'helm-gtags-mod)
 ;; (add-hook 'c++-mode-hook 'helm-gtags-mode)
 ;; (add-hook 'asm-mode-hook 'helm-gtags-mode)

 ;; key bindings
 (with-eval-after-load 'helm-gtags
   (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
   (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
   (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
   (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
   (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
   (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)))

(provide 'init-helm)
;;; init-helm.el ends here
