;;; init-cc++-mode-style.el --- Project config for c/c++ language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(c-add-style "my-c-default-style"
             '((indent-tabs-mode . nil)
              (c-basic-offset . 4)
              (c-offsets-alist
               (substatement-open . 0)
               (block-open . 0)
               (inline-open . 0)
               (case-label . +)
               (access-label . /)
               (innamespace . -))))

(add-to-list 'c-default-style '(c-mode . "my-c-default-style"))
(add-to-list 'c-default-style '(c++-mode . "my-c-default-style"))

(provide 'init-cc++-mode-style)
;;; init-cc++-mode-style.el ends here
