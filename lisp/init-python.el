;;; init-py.el --- Conguration for Emacs editor for python -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq interpreter-mode-alist
      (cons '("python" . python-mode) interpreter-mode-alist))

(eval-after-load 'python
  (progn
    (setq electric-indent-chars (delq ?: electric-indent-chars))))

(provide 'init-python)
;;; init-python.el ends here
