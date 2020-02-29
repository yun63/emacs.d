;;; init-utils.el --- Elisp helper functions and commands -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(defun local-require (pkg)
  "Load local `PKG` if pkg exists."
  (unless (featurep pkg)
    (load (expand-file-name (format "~/.emacs.d/site-lisp/%s/%s" pkg pkg)))))

(if (fboundp 'with-eval-after-load)
    (defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))

(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
    (lambda ()
        (message "Emacs ready in %s with %d garbage collections."
            (format "%.2f seconds"
                (float-time
                    (time-subtract after-init-time before-init-time)))
        gcs-done)))

(global-set-key (kbd "s-=") (lambda ()
                              (interactive)
                              (let ((old-face-attribute (face-attribute 'default :height)))
                                (set-face-attribute 'default nil :height (+ old-face-attribute 10)))))

(global-set-key (kbd "s--") (lambda ()
                              (interactive)
                              (let ((old-face-attribute (face-attribute 'default :height)))
                                (set-face-attribute 'default nil :height (- old-face-attribute 10)))))


(provide 'init-utils)
;;; init-utils.el ends here
