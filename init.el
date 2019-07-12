;;-----------------------------------------------------------------
;; LUKAS' EMACS CONFIG
;;-----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Initialize MELPA package repository
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize)
)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Set the value of the initial start message to nil such that the
;; default buffer message i.e. "This buffer is for..." is suppressed.
(setq initial-scratch-message nil)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Set the default mode for a new emacs buffer to be text-mode
;; rather than elisp interaction doc
(setq initial-major-mode 'text-mode)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Enable mouse interactivity in terminal mode (scrolling, etc)
(xterm-mouse-mode 1)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Set default tab width to 4 unless specified otherwise in a language mode
;; specific hook
(setq c-basic-offset 4)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Enable having line numbers appear on the LHS of the buffer
;; and highlight the number of your current line number

(global-linum-mode t)
(require 'hlinum)
(hlinum-activate)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Manually set theme path and load theme example
;; (add-to-list 'custom-theme-load-path "/home/lukas/.emacs.d/themes/")
;; (load-theme 'cyberpunk t)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Set font size:
;; 10pt = 100, 12pt = 120, etc.
;; Here, I set the font size to 12pt/
(set-face-attribute 'default nil
                    :family "consolas"
                    :height 120
                    :weight 'normal
                    :width 'normal)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Make cursor a normal bar cursor instead of box
(setq-default cursor-type 'bar)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Set cursor color (purple)
(set-cursor-color "#d742f4")
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Make system copy and paste work with emacs copy and paste
;; (Necessary to be able to copy and paste in and out of emacs from
;; other applications)
(setq x-select-enable-clipboard t)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Set neotree extension to execute by pressing the f8 key
(global-set-key [f8] 'neotree-toggle)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Enable smooth scrolling (default emacs scrolling sucks)
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Autocomplete go code
;(require 'go-autocomplete)
;(require 'auto-complete-config)
;(ac-config-default)
;(add-hook 'completion-at-point-functions 'go-complete-at-point)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Nick's CMPT 315 addons
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
;; ----------------------------------------------------------------
;; Script to fix line number bullshit
;; This script is set for a `text-scale-mode-step` of `1.04`
;(require 'linum)
;(defun linum-update-window-scale-fix (win)
 ; "fix linum for scaled text"
 ; (set-window-margins win
 ;         (ceiling (* (if (boundp 'text-scale-mode-step)
 ;                 (expt text-scale-mode-step
 ;                   text-scale-mode-amount) 1)
  ;            (if (car (window-margins))
 ;                 (car (window-margins)) 1)
 ;             ))))
;(advice-add #'linum-update-window :after #'linum-update-window-scale-fix)

;; ----------------------------------------------------------------
;; Custom-set-variables and custom-set faces are both
;; autogenerated from changing settings and installing packages
;; within emacs itself. Don't edit this code.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (doom-dracula)))
 '(custom-safe-themes
   (quote
    ("55ff1b187304abeb43eb61ff3151deee8d64e749c5b622981ad0f6399defce06" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" default)))
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (auto-complete yalinum nlinum-hl hlinum evil nlinum-relative smooth-scrolling go-complete go-mode restart-emacs org-journal helm-youtube chess doom-themes restclient neotree)))
 '(tab-stop-list
   (quote
    (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))
;; ----------------------------------------------------------------
