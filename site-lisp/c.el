
(use-package irony
  :ensure t
  :hook ((c++-mode . irony-mode)
	 (c-mode . irony-mode))
  :config
  (add-hook 'iron-mode-hook 'irony-cdb-autosetup-compile-options)

  (provide 'c)
  ;;; c.el ends here
