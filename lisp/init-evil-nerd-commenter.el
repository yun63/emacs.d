;;; init-evil-nerd-commenter.el --- Conguration for code comment/uncomment -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package evil-nerd-commenter
  :config
  ;; Emacs key bindings
  (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
  (global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
  (global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
  (global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs))

(provide 'init-evil-nerd-commenter)
;;; init-evil-nerd-commenter.el ends here
