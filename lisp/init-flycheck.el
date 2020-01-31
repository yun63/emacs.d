;;; init-flycheck.el --- Configure Flycheck global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flycheck
  :hook (after-init . global-flycheck-mode)
  :config
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)

  (use-package flycheck-color-mode-line
    :hook (flycheck-mode . flycheck-color-mode-line-mode))
  )


(provide 'init-flycheck)
;;; init-flycheck.el ends here
