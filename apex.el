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

;; The following line is necessary to prevent url.el from automatically
;; adding the header Accept-Encoding: gzip to every request (bizzare)
(setq url-mime-encoding-string "identity")

;;;###autoload
;; Login routine that the user must call prior to using any of the other functions
(defun apex-login () (interactive)
    (setq responseBody (nth 1 (split-string (let
        ((url-request-method "POST")
         (url-request-extra-headers
          '(("Content-Type" . "application/json")))
         (url-request-data "{\"data\": {\"username\": \"admin\", \"password\": \"12345New\"}}"))
        (with-current-buffer (url-retrieve-synchronously "https://localhost/action/loginAuthenticate") (prog1 (buffer-string)))) "\n\n")))
    (if (cl-search "{\"status\":\"success\"" responseBody) (message "Authentication successful.")))

;; Retrieves all names of the given type of code and inserts them into a new buffer called apex-[codetype]-list
(defun apex-get-list (codeType)
    (interactive "sWhat type of code? (reducer, logic, or rule): ")
    (setq responseBody (nth 1 (split-string (let
                       ((url-request-method "GET"))
                     (with-current-buffer (url-retrieve-synchronously (concat "https://localhost/action/codeEditorPlugin?op=getlist&codetype=" codeType)) (prog1 (buffer-string)))) "\n\n")))
    (switch-to-buffer (get-buffer-create (concat "apex-" codeType "-list")))
    (with-current-buffer (concat "apex-" codeType "-list")
      (goto-char (point-max)) (insert responseBody) (beginning-of-buffer) (read-only-mode)))

(defun apex-get-code (codeType codeName)
    (interactive "sWhat type of code? (reducer, logic, or rule): ")
    (interactive (concat "sWhat is the name of the " codeType "?: "))
)

(provide 'apex)
;;; apex.el ends here
