;;; init-flycheck.el --- Configure Flycheck global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flycheck
  :defer t
  :hook (after-init . global-flycheck-mode)
  :config
  (setq flycheck-flake8-maximum-line-length 120))

(use-package flycheck-color-mode-line
  :defer t
  :hook (flycheck-mode . flycheck-color-mode-line-mode))


(provide 'init-flycheck)
;;; init-flycheck.el ends here
