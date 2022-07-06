;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (version< emacs-version "27.0")
  (package-initialize))

(let ((minver "24.4"))
    (when (version< emacs-version minver)
        (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "25.1")
    (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
    (setq gc-cons-threshold init-gc-cons-threshold)
    (add-hook 'emacs-startup-hook
              (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


(global-set-key (kbd "RET") 'newline-and-indent)


;;; Bootstrap config
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;;; Core
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-core)      ;;
(require 'init-evil)

;;; UI
(require 'init-themes)
;;(require 'init-dashboard)
(require 'init-ui)
(require 'init-windows)

;;; Tools
(require 'init-recentf)
(require 'init-ivy)
(require 'init-company)
(require 'init-helm)
(require 'init-projectile)
(require 'init-hippie-expand)
(require 'init-ibuffer)
(require 'init-search)
(require 'init-fzf)
(require 'init-google)
(require 'init-yasnippet)
(require 'init-flycheck)
(require 'init-keyfreq)

;;; Languages
(require 'init-c++)
(require 'init-python)
(require 'init-go)
(require 'init-markdown)
(require 'init-org)
;;(require 'init-java)

;;;
(add-hook 'after-init-hook
          (lambda ()
              (require 'server)
              (unless (server-running-p)
                  (server-start))))

(when (file-exists-p custom-file)
    (load custom-file))


(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here

