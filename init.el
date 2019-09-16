;; Initialize MELPA package repository
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize))

;; Set the value of the initial start message to nil such that the
;; default buffer message i.e. "This buffer is for..." is suppressed.
;; Also suppress useless buffers that emacs likes to open
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)
(setq message-log-max nil)
(kill-buffer "*Messages*")
(add-hook 'minibuffer-exit-hook 
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
            (kill-buffer buffer)))))

;; Set the default mode for a new emacs buffer to be text-mode
;; rather than elisp interaction doc
(setq initial-major-mode 'text-mode)

;; Get rid of menu bar and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Enable having line numbers appear on the LHS of the buffer
;; and highlight the number of your current line number
(cond
 ((string-equal system-type "windows-nt") (global-linum-mode t))
 ((string-equal system-type "gnu/linux") (global-linum-mode t)))
(require 'hlinum)
(hlinum-activate)

;; Enable mouse interactivity in terminal mode
(xterm-mouse-mode 1)

;; Fix indentation to 4 spaces per tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))

;; Implement smoother scrolling *efficiently*
(setq scroll-conservatively 101) ;; move minimum when cursor exits view, instead of recentering
(setq mouse-wheel-scroll-amount '(1)) ;; mouse scroll moves 1 line at a time, instead of 5 lines
(setq mouse-wheel-progressive-speed nil) ;; on a long mouse scroll keep scrolling by 1 line

;; Colorize matching brackets
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Set font attributes:
;; 10pt = 100, 12pt = 120, etc.
;; Here, I set the font size to 12p.
;; I also set font to consolas if I'm running in Windows,
;; as Hack seems to break on Windows. Currently looking into this.
(cond
 ((string-equal system-type "windows-nt")
  (set-face-attribute 'default nil
                    :family "consolas"
                    :height 110
                    :weight 'normal
                    :width 'normal))
 ((string-equal system-type "gnu/linux")
  (set-face-attribute 'default nil
                    :family "Hack"
                    :height 110
                    :weight 'normal
                    :width 'normal)))

;; Make cursor a normal bar cursor and make cursor purple
(setq-default cursor-type 'bar)
(set-cursor-color "#d742f4")

;; Make system copy and paste work with emacs copy and paste
;; (Necessary to be able to copy and paste in and out of emacs from
;; other applications)
(setq x-select-enable-clipboard t)

;; Prevent emacs from creating garbage lockfiles and
;; have it save temporary files in the .emacs.d directory
(setq create-lockfiles nil)
(setq backup-directory-alist `(("." . "~/.saves")))

;; Set treemacs extension to toggle by pressing the f9 key
(global-set-key [f9] 'treemacs)

;; Enable and configure centaur tabs
(require 'centaur-tabs)
(centaur-tabs-mode t)
;; (global-set-key (kbd "C-7") 'centaur-tabs-add-tab)
;; (global-set-key (kbd "C-8") 'centaur-tabs-backward)
;; (global-set-key (kbd "C-9") 'centaur-tabs-forward)
(setq centaur-tabs-style "alternate")
(setq centaur-tabs-set-bar 'over)

;; Enable slime and set default lisp
(cond
 ((string-equal system-type "windows-nt") (load (expand-file-name "c:/Users/ljenks/quicklisp/slime-helper.el")))
 ((string-equal system-type "gnu/linux") (load (expand-file-name "~/quicklisp/slime-helper.el"))))
(setq inferior-lisp-program "alisp")

;; Enable org-mode bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Suppress line numbers in various modes
(add-hook 'treemacs-mode-hook (lambda() (linum-mode -1)))
(add-hook 'tetris-mode-hook (lambda() (linum-mode -1)))
(add-hook 'snake-mode-hook (lambda() (linum-mode -1)))
(add-hook 'doctor-mode-hook (lambda() (linum-mode -1)))

;; ------------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" default)))
 '(package-selected-packages
   (quote
    (org-bullets org slime centaur-tabs treemacs hlinum monokai-theme rainbow-delimiters))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; For when I get around to converting to org file

;; (org-babel-load-file (expand-file-name "settings.org"
;;                    user-emacs-directory))
