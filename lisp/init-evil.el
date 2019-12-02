;;; init-evil.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package evil
  :ensure t
  :init
  ;; enable evil-mode
  (evil-mode 1)

  (use-package evil-leader
    :ensure t)

  (use-package ace-jump-mode
    :ensure t)
  )


(provide 'init-evil)
;;; init-evil.el ends here
