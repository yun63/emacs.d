;;; init-evil.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package evil
  :ensure t
  :defer 1
  :init
  (evil-mode 1))

(use-package evil-leader
  :ensure t)

(use-package ace-jump-mode
  :ensure t
  :commands ace-jump-mode)


(provide 'init-evil)
;;; init-evil.el ends here
