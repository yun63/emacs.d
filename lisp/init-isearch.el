;;; init-isearch.el --- isearch settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Show number of matches while searching
(use-package anzu
  :ensure t
  :init
  (setq anzu-mode-lighter "")
  :hook (after-init . global-anzu-mode)
  :config
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  )

(after-load 'isearch
  '(progn
     (define-key isearch-mode-map [remap isearch-del-char] 'isearch-del-char)
     (when (fboundp 'isearch-occur)
       ;; to match ivy conventions
       (define-key isearch-mode-map (kbd "C-c C-o") 'isearch-occur))
     (defun isearch-yank-symbol ()
       "*Put symbol at current point into search string."
       (interactive)
       (let ((sym (thing-at-point 'symbol)))
         (if sym
             (progn
               (setq isearch-regexp t
                     isearch-string (concat "\\_<" (regexp-quote sym) "\\_>")
                     isearch-message (mapconcat 'isearch-text-char-description isearch-string "")
                     isearch-yank-flag t))
           (ding)))
       (isearch-search-and-update))
     (define-key isearch-mode-map "\C-\M-w" 'isearch-yank-symbol)
  ))


(defun my-isearch-exit-other-end ()
  "Exit isearch, but at the other end of the search string.
This is useful when followed by an immediate kill."
  (interactive)
  (isearch-exit)
  (goto-char isearch-other-end))

(define-key isearch-mode-map [(control return)] 'my-isearch-exit-other-end)


(provide 'init-isearch)
;;; init-isearch.el ends here
