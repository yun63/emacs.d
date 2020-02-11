;;; init-py.el --- Conguration for Emacs editor for python -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package epc
  :ensure t)

(use-package jedi
  :hook
  (python-mode . jedi:setup)

  :config
  (defvar jedi-config:with-virtualenv nil
    "Set to non-nil to point to a particular virtualenv.")
  (defvar jedi-config:vcs-root-sentinel ".git")
  (defvar jedi-config:python-module-sentinel "__init__.py")
  (defun get-project-root (buf repo-type)
    (vc-find-root (expand-file-name (buffer-file-name buf)) repo-type))
  (defvar jedi-config:find-root-function 'get-project-root)

  (defun current-buffer-project-root ()
    (funcall jedi-config:find-root-function
             (current-buffer)
             jedi-config:vcs-root-sentinel
             jedi-config:python-module-sentinel))

  (defvar jedi-config:user-system-python t)

  (defun jedi-config:set-python-executable ()
    (make-local-variable 'jedi:server-command)
    (set 'jedi:server-command
         (list (executable-find "python")
               (cadr jedi:server-command))))
  
  (add-to-list 'ac-sources 'ac-source-jedi-direct)
  )

(provide 'init-python)
;;; init-python.el ends here
