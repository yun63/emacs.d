;;; init-py.el --- Conguration for Emacs editor for python -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package python
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python3" . python-mode)
  :config
  (setq python-shell-completion-native-enable nil)
  (setq indent-tabs-mode nil)
  (setq python-indent-offset 4))


(use-package py-autopep8
  :ensure t
  :hook (python-mode . py-autopep8-enable-on-save))


(use-package company-jedi
  :defer t
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook (lambda ()
                                (add-to-list (make-local-variable 'company-backends)
                                             'company-jedi))))


(provide 'init-python)
;;; init-python.el ends here
