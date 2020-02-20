;;; init-ivy.el --- Use ivy for minibuffer completion and more -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package ivy
  :ensure t
  :init
  (setq enable-recursive-minibuffers t)
  (add-hook 'after-init-hook #'ivy-mode)
  :config
  (setq-default ivy-use-virtual-buffers t
		ivy-virtual-abbreviate 'fullpath
		ivy-count-format ""
		projectile-completion-system 'ivy
		ivy-magic-tilde nil
        ivy-on-del-error-function nil
		ivy-dynamic-exhibit-delay-ms 10
		ivy-use-selectable-prompt t)
  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
  (dolist (k '("C-j" "C-RET"))
    (define-key ivy-minibuffer-map (kbd k) #'ivy-immediate-done))

  (use-package counsel
    :ensure t
    :init
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "C-h f") 'counsel-describe-function)
    (global-set-key (kbd "C-h v") 'counsel-describe-variable)
    (global-set-key (kbd "C-h l") 'counsel-find-library)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    :config
    (setq-default ivy-initial-inputs-alist
		  '((Man-completion-table . "^")
		    (woman . "^")))
    (setq counsel-find-file-ignore-regexp "\\(?:^[#.]\\)\\|\\(?:[#~]$\\)\\|\\(?:^Icon?\\)")
    (add-hook 'after-init-hook 'counsel-mode)
    )

  (use-package ivy-xref
    :defer t
    :init
    (setq xref-show-xrefs-function 'ivy-xref-show-xrefs))

  (use-package swiper
    :defer 2
    :init
    (global-set-key "\C-s" 'swiper))
  )


(provide 'init-ivy)
;;; init-ivy.el ends here
