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

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t))


(defconst emacs-local-dir
  (concat user-emacs-directory ".local-dir/")
  "Root directory for local storage
Use this as a local storage for some caches")

(defun local-require (pkg)
  (unless (featurep pkg)
    (load (expand-file-name (format "~/.emacs.d/site-lisp/%s/%s" pkg pkg)))))

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

(use-package diminish
  :ensure t)

(use-package bind-key
  :ensure t)

;;(use-package auto-package-update
;;  :ensure t
;;  :config
;;  (setq auto-package-update-delete-versions t)
;;  (auto-package-update-maybe))

(use-package exec-path-from-shell
  :ensure t
  :defer 2
  :config
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
    (add-to-list 'exec-path-from-shell-variables var))
  (when (or (memq window-system '(mac ns x))
	    (unless (memq system-type '(ms-dos windows-nt))
	      (daemonp)))
    (exec-path-from-shell-initialize))
  )

(use-package which-key
  :defer 2)

;;; On-demand installation of packages
(require 'cl-lib)

(provide 'init-core)
;;; init-core.el ends here
