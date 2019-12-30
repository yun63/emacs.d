;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(use-package company
  :ensure t
  :commands (global-company-mode)
  :init
  (setq tab-always-indent 'complete)
  (add-to-list 'completion-styles 'initials t)
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-show-numbers t)
  (setq company-selection-wrap-around t)
  (setq company-minimum-prefix-length 3)
  (setq-default company-dabbrev-other-buffers 'all
		company-tooltip-align-annotations t)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  )

(use-package company-box
  :ensure t
  :ensure all-the-icons
  :after (company all-the-icons)
  :defer t
  :commands (company-box-mode)
  :hook (company-mode . company-box-mode)
  :init (setq company-box-doc-enable nil ; disable auto `company-box-doc' timer.
              company-box-show-single-candidate t ; for still can use doc popup keybinding.
              company-box-doc-delay 0.5
              company-box-icons-alist 'company-box-icons-all-the-icons)
  :config
  (setq company-box-backends-colors
        '((company-capf . (:candidate "LightSeaGreen"))
          (company-keywords . (:icon "SlateBlue" :candidate "SlateBlue"))
          (company-files . (:candidate "CornflowerBlue"))
          (company-yasnippet . (:icon "DarkCyan"
                                      :candidate "DarkCyan" :annotation "SteelBlue"
                                      ;; :selected (:foreground "white")
                                      ))
          (company-tempo . (:candidate "chocolate"))
          (company-dabbrev . (:candidate "black"))
          (company-dabbrev-code . (:candidate "gray" :selected "gray"))
          ;; extra backends
          (company-elisp . (:icon "firebrick"))
          (sly-company . (:icon "RoyalBlue"))
          (company-slime . (:icon "RoyalBlue"))
          (geiser-company-backend . (:icon "SlateBlue"))
          (elpy-company-backend . (:icon "orange"))
          (company-robe . (:icon "red1"))
          (company-c-headers . (:icon "DarkGoldenrod"))
          (company-irony . (:icon "DodgerBlue"))
          (company-irony-c-headers . (:icon "DarkGoldenrod"))
          (company-go . (:icon "SandyBrown"))
          (company-racer . (:icon "SteelBlue"))
          (company-tern . (:icon "yellow3"))
          (company-lua . (:icon "LightBlue"))
          (company-edbi . (:icon "DarkGreen"))
          (company-restclient . (:icon "DarkTurquoise"))))
  )

(use-package company-quickhelp
  :ensure t
  :init (add-hook 'global-company-mode #'company-quickhelp-mode))

(use-package smex
  :ensure t
  :bind (("M-x" . smex))
  :config (smex-initialize))

(provide 'init-company)
;;; init-company.el ends here
