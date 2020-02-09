;;; init-lua.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lua-mode
  :defer t
  :mode "\\.lua\\'")

(use-package company-lua
  :after lua
  :defer t)

(provide 'init-lua)
;;; init-lua.el ends here
