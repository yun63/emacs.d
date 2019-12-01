;;; init-ivy.el --- Use ivy for minibuffer completion and more -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package ivy
  :ensure t
  :init
  (add-hook 'after-init-hook #'ivy-mode)
  :config
  (setq-default ivy-use-virtual-buffers t
		ivy-virtual-abbreviate 'fullpath
		ivy-count-format ""
		projectile-completion-system 'ivy
		ivy-magic-tilde nil
		ivy-dynamic-exhibit-delay-ms 10
		ivy-use-selectable-prompt t)
  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
  (dolist (k '("C-j" "C-RET"))
    (define-key ivy-minibuffer-map (kbd k) #'ivy-immediate-done))

  (use-package counsel
    :ensure t
    :config
    (setq-default ivy-initial-inputs-alist
		  '((Man-completion-table . "^")
		    (woman . "^")))
    (add-hook 'after-init-hook 'counsel-mode)
    )

  (use-package ivy-xref
    :ensure t
    :init
    (setq xref-show-xrefs-function 'ivy-xref-show-xrefs))
  )


(provide 'init-ivy)
;;; init-ivy.el ends here
