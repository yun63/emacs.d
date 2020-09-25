;;; init-java.el --- Emacs for Java language -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Yaner

;; Author: Yaner <Yaner@MacBookPro.local>
;; Keywords: Java

;;; Commentary:
;;; Code:

(use-package meghanada
  :config
  (add-hook 'java-mode-hook
            (lambda ()
              ;; meghanada-mode on
              (meghanada-mode t)
              (flycheck-mode +1)
              ;; use code format
              (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
  (cond
   ((eq system-type 'windows-nt)
    (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
    (setq meghanada-maven-path "mvn.cmd"))
   (t
    (setq meghanada-java-path "java")
    (setq meghanada-maven-path "mvn"))))


(provide 'init-java)
;;; init-java.el ends here
