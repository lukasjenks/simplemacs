(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize))

(setq initial-major-mode 'text-mode)

(menu-bar-mode -1)
(tool-bar-mode -1)

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

(cond
((string-equal system-type "windows-nt") (global-display-line-numbers-mode t))
((string-equal system-type "gnu/linux") (global-display-line-numbers-mode t)))

;; (require 'hlinum)
;; (hlinum-activate)

(add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1)))
(add-hook 'tetris-mode-hook (lambda() (display-line-numbers-mode-mode -1)))
(add-hook 'snake-mode-hook (lambda() (display-line-numbers-mode -1)))
(add-hook 'doctor-mode-hook (lambda() (display-line-numbers-mode -1)))

(xterm-mouse-mode t)

(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq backward-delete-char-untabify-method 'hungry)

(setq scroll-conservatively 101)

(setq mouse-wheel-scroll-amound '(1))
(setq mouse-wheel-progressive-speed nil)

(setq create-lockfiles nil)

(setq backup-directory-alist `(("." . "~/saves")))

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

(require 'centaur-tabs)
(centaur-tabs-mode t)
;; (global-set-key (kbd "C-7") 'centaur-tabs-add-tab)
;; (global-set-key (kbd "C-8") 'centaur-tabs-backward)
;; (global-set-key (kbd "C-9") 'centaur-tabs-forward)
(setq centaur-tabs-style "alternate")
(setq centaur-tabs-set-bar 'over)

(global-set-key [f9] 'treemacs)

(cond
((string-equal system-type "windows-nt") (load (expand-file-name "c:/Users/ljenks/quicklisp/slime-helper.el")))
((string-equal system-type "gnu/linux") (load (expand-file-name "~/quicklisp/slime-helper.el"))))
(setq inferior-lisp-program "alisp")

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; (ac-config-default)
;; (global-auto-complete-mode t)
;; (ac-linum-workaround)

(add-hook 'after-init-hook 'global-company-mode)

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
	    (if (= (nth 6 time) 7)
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
