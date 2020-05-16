;;; tldr-newsletter.el --- A simple tool for retrieving tldr-newsletters

;; Copyright (C) 2019 Lukas Jenks
;; Author: Lukas Jenks <lukasjenks@gmail.com>
;; Version: 1.0
;; Package-Requires ((none))
;; Keywords: tldr, news, tech news
;; URL: https://github.com/lukasjenks/tldr-newsletter

;;; Commentary:

;; tldr-newsletter.el is a simple set of interactive functions which
;; enable the user to retrieve and read tldr-newsletters from
;; https://www.tldrnewsletter.com

;;; Code:
(require 'json)
;; (require 'url)
;; (require 'image)
;; (require 'browse-url)

;;;###autoload
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

        ;; Render HTML content so it is readable by the user
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
        (if (= (nth 6 time) 7)
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

(provide 'tldr-newsletter)

;;; tldr-newsletter ends here
