;;; init-org.el --- Summary Some cool org2nikola tricks -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:


(use-package org
  :defer t
  :mode ("\\.org$" . org-mode)
  :commands
  (org-indent-mode)
  :config
  (setq org-startup-indented t)
  (add-hook 'org-mode-hook #'org-indent-mode)
  ;; Todo Keyword
  (setq org-todo-keywords '((sequencep "TODO" "STARTUP" "|" "DONE")))
  (setf org-todo-keyword-faces
        '(("TODO" . (:foreground "white" :background "#95A5A6"   :weight bold))
          ("STARTUP" . (:foreground "white" :background "#2E8B57"  :weight bold))
          ("DONE" . (:foreground "white" :background "#3498DB" :weight bold)))))


(defun org-agenda-time-grid-spacing ()
  "Set different line spacing w.r.t. time duration."
  (save-excursion
    (let* ((background (alist-get 'background-mode (frame-parameters)))
           (background-dark-p (string= background "dark"))
           (colors (list "#1ABC9C" "#2ECC71" "#3498DB" "#9966ff"))
           pos
           duration)
      (nconc colors colors)
      (goto-char (point-min))
      (while (setq pos (next-single-property-change (point) 'duration))
        (goto-char pos)
        (when (and (not (equal pos (point-at-eol)))
                   (setq duration (org-get-at-bol 'duration)))
          (let ((line-height (if (< duration 30) 1.0 (+ 0.5 (/ duration 60))))
                (ov (make-overlay (point-at-bol) (1+ (point-at-eol)))))
            (overlay-put ov 'face `(:background ,(car colors)
                                                :foreground
                                                ,(if background-dark-p "black" "white")))
            (setq colors (cdr colors))
            (overlay-put ov 'line-height line-height)
            (overlay-put ov 'line-spacing (1- line-height))))))))

(add-hook 'org-agenda-finalize-hook #'org-agenda-time-grid-spacing)

(provide 'init-org)
;;; init-org.el ends here
