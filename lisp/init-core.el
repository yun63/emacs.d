;;; init-core.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)


;;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                         user-emacs-directory)))
  (setq package-user-dir versioned-package-dir))



;;; Standard package repositories

(add-to-list 'package-archives (cons "melpa" "http://melpa.org/packages/") t)
(add-to-list 'package-archives (cons "melpa-stable" "http://stable.melpa.org/packages/") t)


(defconst emacs-local-dir
  (concat user-emacs-directory ".local-dir/")
  "Root directory for local storage, use this as a local storage for some caches.")

(setq package-enable-at-startup nil)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-and-compile
  (require 'use-package)
  (setq use-package-always-ensure t))

(use-package use-package-ensure-system-package
  :ensure t)

(use-package benchmark-init
  :config
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package diminish
  :ensure t
  :demand t
  :diminish subword-mode
  :diminish eldoc-mode
  :diminish auto-revert-mode
  :diminish hs-minor-mode
  :diminish abbrev-mode
  :diminish overwrite-mode
  :diminish global-whitespace-mode
  :diminish auto-fill-mode)

(use-package bind-key
  :ensure t)

;;(use-package auto-package-update
;;  :ensure t
;;  :config
;;  (setq auto-package-update-delete-versions t)
;;  (auto-package-update-maybe))

(use-package exec-path-from-shell
  :ensure t
  :defer t
  :config
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
    (add-to-list 'exec-path-from-shell-variables var))
  (when (or (memq window-system '(mac ns x))
	    (unless (memq system-type '(ms-dos windows-nt))
	      (daemonp)))
    (exec-path-from-shell-initialize))
  )

;;; On-demand installation of packages
(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

(provide 'init-core)
;;; init-core.el ends here
