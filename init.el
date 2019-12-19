;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

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

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-benchmark) ;; Measure startup time

;;; Core
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
<<<<<<< HEAD
(require 'init-core)      ;; Elpa

;;; UI
(require 'init-ui)
=======
(require 'init-core)      ;;
(require 'init-editor)
(require 'init-ui)
;;;
>>>>>>> 1099bc2acc2e76b9abeeb54cbbda9b3ad1ba2dec
(require 'init-frame-hooks)
;;(require 'init-themes)
(require 'init-editor)

;;; Editor
(require 'init-evil)
<<<<<<< HEAD
(require 'init-osx-keys)

;;; Completion
=======
;;;(require 'init-osx-keys)
;;;(require 'init-gui-frames)
;;;(require 'init-dired)
;;;(require 'init-uniquify)
;;;(require 'init-flycheck)
;;;(require 'init-recentf)
>>>>>>> 1099bc2acc2e76b9abeeb54cbbda9b3ad1ba2dec
(require 'init-ivy)
(require 'init-company)
(require 'init-hippie-expand)
;;(require 'init-hydra.el)

;;; Project
(require 'init-projectile)
(require 'init-ibuffer)
(require 'init-isearch)
(require 'init-windows)
<<<<<<< HEAD
(require 'init-recentf)

;;; Emacs
;;;(require 'init-dired)
;;;(require 'init-flycheck)
;;;
=======
;;; Project
(require 'init-project)
>>>>>>> 1099bc2acc2e76b9abeeb54cbbda9b3ad1ba2dec
;;;(require 'init-editing-utils)
;;;(require 'init-whitespace)

;;; Tools
;;(require 'init-git)
;;(require 'init-github)

;;; Languages

;;;(require 'init-markdown)
;;;(require 'init-csv)
;;;(require 'init-lua-mode)
;;;(require 'init-javascript)
;;;(require 'init-org)
;;;(require 'init-http)
;;;(require 'init-python)
;;;(require 'init-lisp)
;;;(require 'init-common-lisp)
;;;(require 'init-folding)

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
;; init.el ends here
