;;; init-go.el --- Conguration for Emacs editor for Golang -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package go-mode
  :defer 2
  :mode ("\\.go$" . go-mode)
  :config
  (add-hook 'go-mode-hook 'lsp-deferred)

  (use-package go-autocomplete
    :ensure)
  )

(use-package company-go
  :after (:all go-mode company-mode)
  :config
  (setq company-go-show-annotation t)
  (add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'company-backends) '(company-go))
                            (company-mode))))

(use-package go-eldoc
  :after (go-mode)
  :defer 2
  :commands go-eldoc-setup
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(provide 'init-go)

;;; init-go.el ends here
