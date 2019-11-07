;;; init-xterm.el --- Intergrate with terminals such as xterm -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-frame-hooks)

(global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
(global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))

(autoload 'mwheel-install "mwheel")

(defun yun63/console-frame-setup ()
 (xterm-mouse-mode 1)
 (mwheel-install))


(add-hook 'after-make-console-frame-hooks 'yun63/console-frame-setup)
(provide 'init-xterm)
;;; init-xterm.el ends here
