;;; init-google.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package google-this
 :defer t
 :diminish google-this-mode
 :bind-keymap ("C-x g" . google-this-mode-submap))

(provide 'init-google)
;;; init-evil.el ends here
