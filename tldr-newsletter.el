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

		;; Render HTML content so it is readable to the user
		(shr-render-region (point-min) (point-max))
		(beginning-of-buffer)
		(read-only-mode 1)))

;; This function takes the name of a buffer, a string to replace, and a replacement string,
;; and replaces all instances of the string to replace in the given buffer with the new string
(defun replace-in-buffer (buffer old new)
	(with-current-buffer buffer
		(let ((case-fold-search t)) ; or nil
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
    (setq time-list
        (if (>= (nth 2 time) 6)
            (list (nth 5 time)(nth 4 time)(nth 3 time)) ; if past 6am, newsletter is available
		    (list (nth 5 time)(nth 4 time)(- (nth 3 time) 1)))) ; if before 6am, revert to yesterday's newsletter

	;; Now check if it is a saturday/sunday (newsletter is not released on these days)
	;; (if (= (nth 6 time) 6)
		
	(setq url-suffix
		  (concat
			   (number-to-string (nth 0 time-list))
			   (format-number (nth 1 time-list))
			   (format-number (nth 2 time-list)))))
