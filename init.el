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
;; Get rid of scroll bar
(scroll-bar-mode -1)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Get rid of menu bar and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Enable mouse interactivity in terminal mode (scrolling, etc)
(xterm-mouse-mode 1)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Colorize matching brackets
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Set default tab width to 4 unless specified otherwise in a language mode
;; specific hook
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-default-style "linux") 
(setq c-basic-offset 4) 
(c-set-offset 'comment-intro 0)
(setq ess-fancy-comments nil)
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
;; Set font attributes:
;; 10pt = 100, 12pt = 120, etc.
;; Here, I set the font size to 12pt/
(set-face-attribute 'default nil
                    :family "consolas"
                    :height 120
                    :weight 'normal
                    :width 'normal)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Make cursor a normal bar cursor instead of a stupid box
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
(setq-default neo-show-hidden-files t)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Set treemacs extension to toggle by pressing the f9 key
(global-set-key [f9] 'treemacs)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Use package all-the-icons to replace icons in neotree
(require 'all-the-icons)
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
;; Nick's CMPT 315 addons (format go code upon saving)
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Prevent emacs from creating garbage lockfiles
(setq create-lockfiles nil)
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Forces the messages to 0, and kills the *Messages* buffer - thus disabling it on startup.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Enable and configure centaur tabs
(require 'centaur-tabs)
(centaur-tabs-mode t)
(global-set-key (kbd "C-7") 'centaur-tabs-add-tab)
(global-set-key (kbd "C-8") 'centaur-tabs-backward)
(global-set-key (kbd "C-9") 'centaur-tabs-forward)
(setq centaur-tabs-style "alternate")
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Suppress line numbers in various modes
(add-hook 'treemacs-mode-hook (lambda() (linum-mode -1)))
(add-hook 'tetris-mode-hook (lambda() (linum-mode -1)))
(add-hook 'snake-mode-hook (lambda() (linum-mode -1)))
(add-hook 'doctor-mode-hook (lambda() (linum-mode -1)))
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Enable cua-mode to allow Cntrl-C and Cntrl-V as copy and paste
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Enable slime and set default lisp

;; Uncomment following line if on Windows
(load (expand-file-name "c:/Users/ljenks/quicklisp/slime-helper.el"))

;; Uncomment following line if on Linux
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))

;; Replace "sbcl" with your lisp implementation
(setq inferior-lisp-program "sbcl")
;; ----------------------------------------------------------------

;; ----------------------------------------------------------------
;; Custom-set-variables and custom-set faces are both
;; autogenerated from changing settings and installing packages
;; within emacs itself. Don't edit this code.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("37ba833442e0c5155a46df21446cadbe623440ccb6bbd61382eb869a2b9e9bf9" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "3fce9d3a7f9f94ce5fd46d3d7277f0615e253ae64dac16a6e8c89b1924e6cd04" "d5e019cda1ecb6c2bfc6b2d886fe66039b977999f5a516647ae11238cb244c38" "a95f0c3b636b487fed19407fbb81583f37c4e03c42bff43ad5b2c65fc3fc6ea7" "341ac05b01bd993019da315a1471884e0023530c1c29fdc3d7b4e0a6f6e759aa" "c82d24bfba431e8104219bfd8e90d47f1ad6b80a504a7900cbee002a8f04392f" "8f461689cd31614cd5a1c71a25ecd4ab0381937fc99808e9b9545eacbc2ebd53" "f391a94155d991d13aa857d56db98924136b98357640c8239b0e8eb6aca5436b" "24fc62afe2e5f0609e436aa2427b396adf9a958a8fa660edbaab5fb13c08aae6" "55ff1b187304abeb43eb61ff3151deee8d64e749c5b622981ad0f6399defce06" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" default)))
 '(fci-rule-color "#6272a4")
 '(highlight-changes-colors (quote ("#EF5350" "#7E57C2")))
 '(highlight-tail-colors
   (quote
    (("#010F1D" . 0)
     ("#B44322" . 20)
     ("#34A18C" . 30)
     ("#3172FC" . 50)
     ("#B49C34" . 60)
     ("#B44322" . 70)
     ("#8C46BC" . 85)
     ("#010F1D" . 100))))
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (rainbow-delimiters darkokai-theme monokai-theme use-package afternoon-theme all-the-icons slime treemacs zenburn-theme centaur-tabs ac-c-headers ac-html night-owl-theme arc-dark-theme abyss-theme auto-complete yalinum nlinum-hl hlinum evil nlinum-relative smooth-scrolling go-complete go-mode restart-emacs org-journal helm-youtube chess doom-themes restclient neotree)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#FFF9DC")
 '(pos-tip-foreground-color "#011627")
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50fa7b")
    (cons 40 "#85fa80")
    (cons 60 "#bbf986")
    (cons 80 "#f1fa8c")
    (cons 100 "#f5e381")
    (cons 120 "#face76")
    (cons 140 "#ffb86c")
    (cons 160 "#ffa38a")
    (cons 180 "#ff8ea8")
    (cons 200 "#ff79c6")
    (cons 220 "#ff6da0")
    (cons 240 "#ff617a")
    (cons 260 "#ff5555")
    (cons 280 "#d45558")
    (cons 300 "#aa565a")
    (cons 320 "#80565d")
    (cons 340 "#6272a4")
    (cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#011627" "#010F1D" "#DC2E29" "#EF5350" "#D76443" "#F78C6C" "#D8C15E" "#FFEB95" "#5B8FFF" "#82AAFF" "#AB69D7" "#C792EA" "#AFEFE2" "#7FDBCA" "#D6DEEB" "#FFFFFF"))))
;; ----------------------------------------------------------------
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ----------------------------------------------------------------
