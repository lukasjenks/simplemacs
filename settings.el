(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
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
(defun toggle-fold ()
      (interactive)
      (save-excursion
	(end-of-line)
	(hs-toggle-hiding)))

(use-package frame
:ensure nil
:custom
(initial-frame-alist (quote ((fullscreen . maximized))))
:config
(blink-cursor-mode 1)
(when (member "Source Code Pro" (font-family-list))
  (set-frame-font "Source Code Pro-12:weight=regular" t t)))

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

;(setq-default indent-tabs-mode t)
;(setq-default tab-width 4)
;(setq c-basic-offset 4)
;(setq backward-delete-char-untabify-method 'hungry)

; START TABS CONFIG
;; Create a variable for our preferred tab width
(setq custom-tab-width 4)

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
(setq sh-basic-offset 4)
(setq c-basic-offset 4)
(setq-default tab-width 4)

;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; WARNING: This will change your life
;; (OPTIONAL) Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
 '(whitespace-tab ((t (:foreground "#636363")))))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere

(setq scroll-conservatively 101)

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
                 :height 116
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
	 (defun my/tabbar-buffer-groups ()
	       (cond ((member (buffer-name)
					 '("*Completions*"
					       "*scratch*"
					       "*Messages*"
					       "*Ediff Registry*"
					       "*Flycheck error messages*"
					       "*Local Variables*"
					       "*Backtrace*"))
			 (list "#hide"))
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
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(cond
((string-equal system-type "windows-nt") (load (expand-file-name "c:/Users/ljenks/quicklisp/slime-helper.el")))
((string-equal system-type "gnu/linux") (load (expand-file-name "~/quicklisp/slime-helper.el"))))
(setq inferior-lisp-program "sbcl")

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; (ac-config-default)
;; (global-auto-complete-mode t)
;; (ac-linum-workaround)

(add-hook 'after-init-hook 'global-company-mode)

(global-flycheck-mode)

;; Main function. To call, use M-x tldr-newsletter
(defun tldr-newsletter () (interactive)

    (switch-to-buffer (get-buffer-create "tldr-newsletter"))
    (with-current-buffer "tldr-newsletter"
        (goto-char (point-max))

        (cond
            ((string-equal system-type "windows-nt")
                (setq curl-cmd "C:/Windows/System32/curl -s https://www.tldrnewsletter.com/archives/"))
            ((string-equal system-type "gnu/linux")
                (setq curl-cmd "/usr/bin/curl -s https://www.tldrnewsletter.com/archives/")))

        ;; Insert latest tldr newsletter HTML webpage into the buffer
        (insert
            (shell-command-to-string (concat curl-cmd (get-url-suffix))))

 	       (replace-in-buffer "tldr-newsletter" "/sponsor" "https://www.tldrnewsletter.com/sponsor")
 	       (replace-in-buffer "tldr-newsletter" "/privacy" "https://www.tldrnewsletter.com/privacy")
 	       (replace-in-buffer "tldr-newsletter" "/terms" "https://www.tldrnewsletter.com/terms")
 	       (replace-in-buffer "tldr-newsletter" "/archives" "https://www.tldrnewsletter.com/archives")
 	       (replace-in-buffer "tldr-newsletter" "/rss" "https://www.tldrnewsletter.com/rss")

	       (replace-in-buffer "tldr-newsletter" "Big Tech & Startups" "<b><u>Big Tech & Startups</u></b>")
	       (replace-in-buffer "tldr-newsletter" "Science & Cutting Edge Technology" "<b><u>Science & Cutting Edge Technology</b></u>")
	       (replace-in-buffer "tldr-newsletter" "Programming, Design & Data Science" "<b><u>Programming, Design & Data Science</b></u>")
	       (replace-in-buffer "tldr-newsletter" "Miscellaneous" "<b><u>Miscellaneous</b></u>")

        ;; Render HTML content so it is readable to the user
        (shr-render-region (point-min) (point-max))
        (beginning-of-buffer)
        (read-only-mode 1)))

;; This function takes the name of a buffer, a string to replace, and a replacement string,
;; and replaces all instances of the string to replace in the given buffer with the new string
(defun replace-in-buffer (buffer old new)
    (with-current-buffer buffer
        (let ((case-fold-search t))
            (goto-char (point-min))
 		   (while (search-forward old nil t)
 		       (replace-match new)))))

;; This function take a potentially single or double digit number
;; and returns a double digit string, preceding single digit numbers
;; with a zero.
(defun format-number (month)
    (if (< month 10)
    	   (concat "0" (number-to-string month))
    	   (number-to-string month)))

;; This function returns a string representing a date, e.g.
;; "20191002" for Oct. 3rd, 2019. If it has passed 6AM EST,
;; the function returns the current date. If it is earlier than
;; 6AM EST, it returns yesterday's date.
(defun get-url-suffix ()
    (setq time (parse-time-string (current-time-string nil "EST")))
	    ;; Set time list to yesterday's date if its a saturday
	    (if (= (nth 6 time) 6)
		(progn (setq time-list (parse-time-string (format-time-string "%B %d, %Y" (time-subtract (current-time) (* 24 3600)))))
		     (setq time-list (list (nth 5 time-list) (nth 4 time-list) (nth 3 time-list))))
		    ;; Set time list to 2 days ago's date if its a sunday
		    (if (= (nth 6 time) 0)
			(progn (setq time-list (parse-time-string (format-time-string "%B %d, %Y" (time-subtract (current-time) (* 48 3600)))))
			 (setq time-list (list (nth 5 time-list) (nth 4 time-list) (nth 3 time-list))))
			    ;; Otherwise if its past 6am EST and its a weekday, use current date. Else use yesterday's date
			    (if (>= (nth 2 time) 6)
    		   (setq time-list (list (nth 5 time)(nth 4 time)(nth 3 time)))
    		   (progn (setq time-list (parse-time-string (format-time-string "%B %d, %Y" (time-subtract (current-time) (* 24 3600)))))
				(setq time-list (list (nth 5 time-list) (nth 4 time-list) (nth 3 time-list)))))))
    (setq url-suffix
    	   (concat
    		   (number-to-string (nth 0 time-list))
    		   (format-number (nth 1 time-list))
    		   (format-number (nth 2 time-list)))))

;;(define-key (current-global-map) (kbd "M-x indent")
    ;;(lookup-key (current-global-map) (kbd "C-u C-x TAB")))
;;(define-key (current-global-map) (kbd "M-x unindent")
    ;;(lookup-key (current-global-map) (kbd "C-u -4 M-x indent-rigidly")))

(setq x-select-enable-clipboard t)
