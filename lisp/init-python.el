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

  (defun jedi-config:setup-server-agrs ()
    (defmacro add-args (arg-list arg-name arg-value)
      '(setq ,arg-list (append ,arg-list (list ,arg-name ,arg-value))))

    (let ((project-root (current-buffer-project-root)))
      (make-local-variable 'jedi:server-args)

      (when project-root
        (add-args jedi:server-args "--sys-path" project-root))
      (when jedi-config:with-virtualenv
        (add-args jedi:server-args "--virtual-env"
                  jedi-config:with-virtualenv))))

  (defvar jedi-config:user-system-python t)

  (defun jedi-config:set-python-executable ()
    (set-exec-path-from-shell-PATH)
    (make-local-variable 'jedi:server-command)
    (set 'jedi:server-command
         (list (executable-find "python")
               (cadr jedi:server-command))))
  
  (add-to-list 'ac-sources 'ac-source-jedi-direct)
  )

(provide 'init-python)
;;; init-python.el ends here
