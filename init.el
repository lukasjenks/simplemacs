;; LUKAS' EMACS CONFIG

;; Enable mouse interactivity (scrolling, etc)
(xterm-mouse-mode 1)

;; This must come before configurations of
;; installed packages.  Don't delete this line.
(package-initialize)

;; Set default tab width to 4 unless specified otherwise in a language mode
;; specific hook
(setq c-basic-offset 4)

;; Enable having line numbers appear on the LHS of the buffer
(global-linum-mode t)

;; Set theme path and load cyberpunk theme
;; (add-to-list 'custom-theme-load-path "/home/lukas/.emacs.d/themes/")
;; (load-theme 'cyberpunk t)

;; Set font size:
;; 10pt = 100, 12pt = 120, etc.
;; Here, I set the font size to 13pt.
(set-face-attribute 'default nil :height 130)

;; Make system copy and paste work with emacs copy and paste
;; (Necessary to be able to copy and paste in and out of emacs from
;; other applications)
(setq x-select-enable-clipboard t)

;; Neotree extension
(global-set-key [f8] 'neotree-toggle)

;; Add melpa packages to package-list-packages
(require 'package)
(add-to-list 'package-archives
       '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Nick's CMPT 315 addons
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (doom-dracula)))
 '(custom-safe-themes
   (quote
    ("f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" default)))
 '(inhibit-default-init nil)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (restart-emacs org-journal helm-youtube chess go-add-tags go-autocomplete go-complete go-direx go-eldoc go-errcheck go-gopath go-imports go-mode doom-themes restclient neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 120 :width normal)))))
