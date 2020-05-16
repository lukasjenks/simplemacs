;;; apex.el --- A plugin to allow editing code with the apex framework

;; Copyright (C) 2020 Lukas Jenks
;; Author: Lukas Jenks <lukasjenks@gmail.com>
;; Version: 1.0
;; Package-Requires ((none))
;; Keywords: javascript, web
;; URL: https://github.com/lukasjenks/.emacs.d

;;; Commentary:

;; tldr-newsletter.el is a simple set of interactive functions which
;; enable the user to edit code in the apex framework
;;; Code:
(require 'json)
(require 'url)

;; Get login token
(defun apex-login () (interactive)
    (setq responseBody (nth 1 (split-string (let
        ((url-request-method "POST")
         (url-request-extra-headers
          '(("Content-Type" . "application/json")))
         (url-request-data "{\"data\": {\"username\": \"admin\", \"password\": \"12345New\"}}"))
        (with-current-buffer (url-retrieve-synchronously "https://localhost/action/loginAuthenticate") (prog1 (buffer-string)))) "\n\n"))))

(defun apex-get-logics () (interactive)
    (setq responseBody (nth 1 (split-string (let
                       ((url-request-method "GET"))
                     (with-current-buffer (url-retrieve-synchronously "https://localhost/action/nmaSubmitPayment") (prog1 (buffer-string)))) "\n\n"))))

(provide 'apex)
;;; apex.el ends here
