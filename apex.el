;;; apex.el --- A plugin to allow editing code with the apex framework

;; Copyright (C) 2020 Lukas Jenks
;; Author: Lukas Jenks <lukasjenks@gmail.com>
;; Version: 1.0
;; Package-Requires ((none))
;; Keywords: javascript, web
;; URL: https://github.com/lukasjenks/.emacs.d

;;; Commentary:

;; apex.el is a simple set of interactive functions which
;; enable the user to edit code in the apex web framework.
;;; Code:
(require 'json)
(require 'url)

;;;###autoload
(defun apex-login () (interactive)
    "Login so that the user can call apex-get and apex-edit functions with proper cookie"
    (setq responseBody (nth 1 (split-string (let
        ((url-request-method "POST")
         (url-request-extra-headers
          '(("Content-Type" . "application/json")))
         (url-request-data "{\"data\": {\"username\": \"admin\", \"password\": \"12345New\"}}"))
        (with-current-buffer (url-retrieve-synchronously "https://localhost/action/loginAuthenticate") (prog1 (buffer-string)))) "\n\n")))
    (if (cl-search "{\"status\":\"success\"" responseBody) (message "authentication successful")))

(defun apex-get-logics () (interactive)
    (setq responseBody (nth 1 (split-string (let
                       ((url-request-method "GET"))
                     (with-current-buffer (url-retrieve-synchronously "https://localhost/action/codeEditorPlugin") (prog1 (buffer-string)))) "\n\n")))
    (switch-to-buffer (get-buffer-create "apex-logic-list"))
    (with-current-buffer "apex-logic-list"
      (goto-char (point-max)) (insert responseBody)))

(defun test-get-google () (interactive)
    (setq responseBody (nth 1 (split-string (let
                        ((url-request-method "GET"))
                        (with-current-buffer (url-retrieve-synchronously "https://google.ca") (prog1 (buffer-string)))) "\n\n")))
    (switch-to-buffer (get-buffer-create "google"))
    (with-current-buffer "google"
        (goto-char (point-max)) (insert responseBody)))

(provide 'apex)
;;; apex.el ends here
