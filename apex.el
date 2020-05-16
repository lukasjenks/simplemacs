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
(require 'url)
(setq cookieHeader "")

;; Get login token
(defun apex-login () (interactive)
    (setq loginToken (let
        ((url-request-method "POST")
         (url-request-extra-headers
          '(("Content-Type" . "application/json")))
         (url-request-data "{\"data\": {\"username\": \"admin\", \"password\": \"12345New\"}}"))
        (with-current-buffer (url-retrieve-synchronously "https://localhost/action/loginAuthenticate") (prog1 (buffer-string)))))

    (setq cookieset1 (nth 2 (split-string loginToken "\\\n")))
    (setq cookieset2 (nth 3 (split-string loginToken "\\\n")))

    (setq usernamecookie (nth 1 (split-string (nth 0 (split-string cookieset1 ";")) " ")))
    (setq tokencookie (nth 1 (split-string (nth 0 (split-string cookieset2 ";")) " ")))
    (setq cookieHeader (concat cookieHeader usernamecookie "; " tokencookie))

    ;; (setq response (let
    ;;     ((url-request-extra-headers
    ;;       '(("Cookie" . "test"))))
    ;;   (url-retrieve-synchronously "https://localhost/action/nmaSubmitPayment")))
    (setq response (let
                       ((url-request-method "GET"))
                     (with-current-buffer (url-retrieve-synchronously "https://localhost/action/nmaSubmitPayment") (prog1 (buffer-string)))))
)


(provide 'apex)
;;; apex.el ends here
