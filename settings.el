(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize))

(setq initial-major-mode 'text-mode)

(menu-bar-mode -1)
(tool-bar-mode -1)

(display-time-mode 1)

(setq initial-scratch-message nil)
(setq message-log-max nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)

(kill-buffer "*Messages*")
(add-hook 'minibuffer-exit-hook
   '(lambda ()
      (let ((buffer "*Completions*"))
        (and (get-buffer buffer)
         (kill-buffer buffer)))))

(electric-pair-mode 1)

(add-hook 'prog-mode-hook #'hs-minor-mode)
(defun show-fold ()
      (interactive)
      (save-excursion
	(hs-toggle-hiding)))
(defun hide-fold ()
      (interactive)
      (save-excursion
	(end-of-line)
	(hs-toggle-hiding)))
;; Set M-p key cmd to toggle-fold (collapse function or block)
(global-set-key (kbd "M-p") 'hide-fold)
(global-set-key (kbd "M-o") 'show-fold)

(use-package frame
:ensure nil
:config
(blink-cursor-mode 1)
(when (member "Source Code Pro" (font-family-list))
(set-frame-font "Source Code Pro-12:weight=regular" t t)))

(global-auto-revert-mode)

(setq my-unignored-buffers '("*ielm*" "*scratch*"))

(defun my-ido-ignore-func (name)
  "Ignore all non-user (a.k.a. *starred*) buffers except those listed in `my-unignored-buffers'."
  (and (string-match "^\*" name)
       (not (member name my-unignored-buffers))))

(setq ido-ignore-buffers '("\\` " my-ido-ignore-func))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

(cond
((string-equal system-type "windows-nt") (global-display-line-numbers-mode t))
((string-equal system-type "gnu/linux") (global-display-line-numbers-mode t)))

;; highlight line with the cursor, preserving the colours.
(global-hl-line-mode 1)

(defun no-line-numbers ()
    (display-line-numbers-mode -1)
)
(add-hook 'treemacs-mode-hook 'no-line-numbers)
(add-hook 'neotree-mode-hook 'no-line-numbers)
(add-hook 'tetris-mode-hook 'no-line-numbers)
(add-hook 'snake-mode-hook 'no-line-numbers)
(add-hook 'doctor-mode-hook 'no-line-numbers)
(add-hook 'xkcd-mode-hook 'no-line-numbers)
;; disable line numbers in org mode for efficiency
(add-hook 'org-mode-hook 'no-line-numbers)

(column-number-mode 1)

(xterm-mouse-mode t)

(org-indent-mode 1)

; START TABS CONFIG
;; Create a variable for our preferred tab width
(setq custom-tab-width 4)
(setq c-basic-offset 4)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs  ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Hooks to Enable Tabs
(add-hook 'prog-mode-hook 'enable-tabs)
;; Hooks to Disable Tabs
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)

;; Language-Specific Tweaks
(setq-default python-indent-offset custom-tab-width) ;; Python
(setq-default js-indent-level custom-tab-width)      ;; Javascript

;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; (OPTIONAL) Shift width for evil-mode users
;; For the vim-like motions of ">>" and "<<".
(setq-default evil-shift-width custom-tab-width)

;; WARNING: This will change your life
;; (OPTIONAL) Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))
; END TABS CONFIG

(setq scroll-conservatively 101)
(org-reload)

(setq mouse-wheel-scroll-amound '(1))
(setq mouse-wheel-progressive-speed nil)

(setq create-lockfiles nil)

(setq tmp-file-dir "~/.emacstmp")
(setq backup-directory-alist `((".*" . ,tmp-file-dir)))
(setq auto-save-file-name-transforms `((".*" ,tmp-file-dir t)))

(cond
((string-equal system-type "windows-nt")
(set-face-attribute 'default nil
                 :family "consolas"
                 :height 110
                 :weight 'normal
                 :width 'normal))
((string-equal system-type "gnu/linux")
(set-face-attribute 'default nil
                 :family "SourceCodePro-Regular"
                 :height 115
                 :weight 'normal
                 :width 'normal)))

(setq-default cursor-type 'bar)
(set-cursor-color "#d742f4")

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; (require 'centaur-tabs)
		  ;; (centaur-tabs-mode t)
		  ;; (global-set-key (kbd "C-7") 'centaur-tabs-add-tab)
		  ;; (global-set-key (kbd "C-8") 'centaur-tabs-backward)
		  ;; (global-set-key (kbd "C-9") 'centaur-tabs-forward)
		  ;; (setq centaur-tabs-style "alternate")
		  ;; (setq centaur-tabs-set-bar 'under)
		  ;; (setq centaur-theme 'dark)
		  ;; (setq centaur-logo nil)

;; (use-package centaur-tabs
;;   :demand
;;   :bind (("M-j" . centaur-tabs-backward)
;;          ("M-k" . centaur-tabs-forward)
;;          ("M-l" . centaur-tabs-counsel-switch-group))
;;   :custom
;;   (centaur-tabs-set-bar 'under)
;;   (x-underline-at-descent-line t)
;;   (centaur-tabs-set-modified-marker t)
;;   (centaur-tabs-modified-marker " ● ")
;;   (centaur-tabs-cycle-scope 'tabs)
;;   (centaur-tabs-height 30)
;;   (centaur-tabs-set-icons t)
;;   (centaur-tabs-close-button " × ")
;;   :config
;;   (centaur-tabs-mode +1)
;;   (centaur-tabs-headline-match)
;;   (centaur-tabs-group-by-projectile-project)
;;   (when (member "Arial" (font-family-list))
;;     (centaur-tabs-change-fonts "Arial" 130)))

	 ;; Tab Bar
	 (require 'tabbar)
	 (customize-set-variable 'tabbar-background-color "gray20")
	 (customize-set-variable 'tabbar-separator '(0.0))
	 (customize-set-variable 'tabbar-use-images nil)
	 (tabbar-mode 1)

	 ;; My preferred keys
	 (global-set-key (kbd "M-j") 'tabbar-backward)
	 (global-set-key (kbd "M-k") 'tabbar-forward)

	 ;; Colors
	 (set-face-attribute 'tabbar-default nil
			:background "gray20" :foreground
			"gray60" :distant-foreground "gray50"
			:family "Helvetica Neue" :box nil)
	 (set-face-attribute 'tabbar-unselected nil
			:background "gray80" :foreground "black" :box nil)
	 (set-face-attribute 'tabbar-modified nil
			:foreground "red4" :box nil
			:inherit 'tabbar-unselected)
	 (set-face-attribute 'tabbar-selected nil
			:background "#4090c0" :foreground "white" :box nil)
	 (set-face-attribute 'tabbar-selected-modified nil
			:inherit 'tabbar-selected :foreground "GoldenRod2" :box nil)
	 (set-face-attribute 'tabbar-button nil
			:box nil)

	 ;; Group tabs by project/directory, and hide some buffer <https://www.emacswiki.org/emacs/TabBarMode#toc15>
	 (setq my-unignored-buffers '("*foobar*"))
	 (defun my/tabbar-buffer-groups ()
	       (cond ((and (string-match "^\*" (buffer-name)) (not (member (buffer-name) my-unignored-buffers))) (list "#hide"))
			(t (list (or (cdr (project-current))
						 (expand-file-name default-directory))))))
	 (setq tabbar-buffer-groups-function #'my/tabbar-buffer-groups)

	 ;; Keep tabs sorted <https://www.emacswiki.org/emacs/TabBarMode#toc7>
	 ;; ;; (defun tabbar-add-tab (tabset object &optional _append_ignored)
	 ;; ;;   "Add to TABSET a tab with value OBJECT if there isn't one there yet.
	 ;; ;;  If the tab is added, it is added at the beginning of the tab list,
	 ;; ;;  unless the optional argument APPEND is non-nil, in which case it is
	 ;; ;;  added at the end."
	 ;; ;;   (let ((tabs (tabbar-tabs tabset)))
	 ;; ;; 	(if (tabbar-get-tab object tabset)
	 ;; ;; 		tabs
	 ;; ;; 	  (let ((tab (tabbar-make-tab object tabset)))
	 ;; ;; 		(tabbar-set-template tabset nil)
	 ;; ;; 		(set tabset (sort (cons tab tabs)
	 ;; ;; 				 (lambda (a b) (string< (buffer-name (car a))
	 ;; ;; 							   (buffer-name (car b))))))))))

	 ;; ;; ;; Use Powerline to make tabs look nicer
	 ;; ;; (this needs to run *after* the colors are set)
	 (require 'powerline)
	 (defvar my/tabbar-height 20)
	 (defvar my/tabbar-left (powerline-wave-right 'tabbar-default nil my/tabbar-height))
	 (defvar my/tabbar-right (powerline-wave-left nil 'tabbar-default my/tabbar-height))
	 (defun my/tabbar-tab-label-function (tab)
	 (powerline-render (list my/tabbar-left
	 (format " %s  " (car tab))
	 my/tabbar-right)))
	 (setq tabbar-tab-label-function #'my/tabbar-tab-label-function)

(global-set-key [f9] 'treemacs)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq inhibit-compacting-font-caches t)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;(cond
;;((string-equal system-type "windows-nt") (load (expand-file-name "c:/Users/ljenks/quicklisp/slime-helper.el")))
;;((string-equal system-type "gnu/linux") (load (expand-file-name "~/quicklisp/slime-helper.el"))))
;;(setq inferior-lisp-program "sbcl")

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; (ac-config-default)
;; (global-auto-complete-mode t)
;; (ac-linum-workaround)

;;(add-hook 'after-init-hook 'global-company-mode)

;;(global-flycheck-mode)

(use-package lsp-mode
   :init
   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
   (setq lsp-keymap-prefix "C-l")
   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	  (python-mode . lsp)
	  (js-mode . lsp)
	  ;; if you want which-key integration
	  (lsp-mode . lsp-enable-which-key-integration))
   :commands lsp)

 ;; optionally
 (use-package lsp-ui :commands lsp-ui-mode)
 ;; if you are helm user
 (use-package helm-lsp :commands helm-lsp-workspace-symbol)
 ;; optionally if you want to use debugger
 (use-package dap-mode)
 ;; (use-package dap-LANGUAGE) to load the dap adapter for your language

 ;; optional if you want which-key integration
 (use-package which-key
     :config
 (which-key-mode))

 (use-package lsp-pyright
    :ensure t
    :hook (python-mode . (lambda ()
          	      (require 'lsp-pyright)
          	      (lsp))))  ; or lsp-mode

;(require 'evil)
;(evil-mode t)
;(define-key evil-normal-state-map "gT" 'tabbar-backward)
;(define-key evil-normal-state-map "gt" 'tabbar-forward)

(add-hook 'after-init-hook #'global-emojify-mode)
 (use-package emojify
:hook (after-init . global-emojify-mode))

(load "~/.emacs.d/plugins/tldr-newsletter.el")
(load "~/.emacs.d/plugins/apex.el")

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;;(define-key (current-global-map) (kbd "M-x indent")
    ;;(lookup-key (current-global-map) (kbd "C-u C-x TAB")))
;;(define-key (current-global-map) (kbd "M-x unindent")
    ;;(lookup-key (current-global-map) (kbd "C-u -4 M-x indent-rigidly")))

(global-set-key (kbd "C-M-x") 'apply-macro-to-region-lines)
(global-set-key (kbd "C-M-q") 'recover-this-file)
(bind-key "M-n" 'name-last-kbd-macro)
(bind-key "M-I" 'insert-kbd-macro)
(bind-key "M-P" 'json-pretty-print)

(setq bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

;;(global-so-long-mode 1)

(setq x-select-enable-clipboard t)

(add-to-list 'load-path "/path/to/auto-package-update")
(require 'auto-package-update)
(setq auto-package-update-prompt-before-update t)
(auto-package-update-at-time "13:00")

;;(exec-path-from-shell-copy-env 'PATH)
(exec-path-from-shell-initialize)
