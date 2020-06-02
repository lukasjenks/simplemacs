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

;;; Usage Guide:

;; First, place this file in your .emacs.d directory.  Then, in init.el
;; add the following Lisp form: (load "~/.emacs.d/apex.el")

;; Replace username and password value on line 58 with the administrator
;; username and password that you use to login normally.

;; First, you must login to the web service.  You can do that by executing:
;; M-x a-login
;; When you receive the message: "Authentication successful." in the minibuffer,
;; you are ready to start using this plugin.

;; How to access and edit code:
;; M-x a-get-list
;; Executing this and responding to its prompts will open a new buffer with
;; a list of the names of all  either [reducers/logic/rules] in the database.

;; M-x a-get-code
;; Executing this and responding to its prompts will open a new buffer with
;; the contents of a certain [reducer/logic/rule] given its name.  You can
;; then edit the code in this buffer.

;; M-x a-post-code
;; Once you are done editing the code using a-get-code, use this function
;; to post that code back in the database.

;;; Code:
(require 'json)
(require 'url)

;; The following line is necessary to prevent url.el from automatically
;; adding the header Accept-Encoding: gzip to every request (bizzare)
(setq url-mime-encoding-string "identity")

;;;###autoload
(defun a-login ()
    "Login routine that the user must call prior to using any of the other interactive functions."
    (interactive)
    (setq responseBody (nth 1 (split-string (let
        ((url-request-method "POST")
         (url-request-extra-headers
          '(("Content-Type" . "application/json")))
         (url-request-data "{\"data\": {\"username\": \"usernamehere\", \"password\": \"passwordhere\"}}"))
        (with-current-buffer (url-retrieve-synchronously "https://localhost/action/loginAuthenticate") (prog1 (buffer-string)))) "\n\n")))
    (if (cl-search "{\"status\":\"success\"" responseBody) (message "Authentication successful.")))

(defun a-test ()
  (interactive)
      (setq responseBody (nth 1 (split-string (let
        ((url-request-method "POST")
         (url-request-extra-headers
          '(("Content-Type" . "application/json")))
         (url-request-data "{\"data\": {\"username\": \"admin\", \"password\": \"12345New\"}}"))
        (with-current-buffer (url-retrieve-synchronously "https://localhost/rules/save") (prog1 (buffer-string)))) "\n\n")))
      (message responseBody))

;;;###autoload
(defun a-get-list (codeType)
    "Retrieve list of all given type of code (reduer, logic, or rule) and insert them into a new buffer called apex-[CODETYPE]-list, then switch to that new buffer."
    (interactive "sWhat type of code? (reducer, logic, or rule): ")
    (setq responseBody (nth 1 (split-string (let
                       ((url-request-method "GET"))
                     (with-current-buffer (url-retrieve-synchronously (concat "https://localhost/action/codeEditorPlugin?op=getlist&codetype=" codeType)) (prog1 (buffer-string)))) "\n\n")))
    (switch-to-buffer (get-buffer-create (concat "apex-" codeType "-list")))
    (with-current-buffer (concat "apex-" codeType "-list")
      (goto-char (point-max)) (insert responseBody) (beginning-of-buffer) (read-only-mode)))

;;;###autoload
(defun a-get-code (codeType codeName)
    "Retrieve the code text given the CODETYPE and CODENAME, insert it into a new 'js-mode' buffer, then switch to that buffer."
    (interactive "sWhat type of code? (reducer, logic, or rule): \nsWhat is the name of the code?: ")
    (setq responseBody (let
                       ((url-request-method "GET"))
                     (with-current-buffer (url-retrieve-synchronously (concat "https://localhost/action/codeEditorPlugin?op=getcode&codetype=" codeType "&codename=" codeName)) (prog1 (buffer-string)))))
    (switch-to-buffer (get-buffer-create (concat codeType "-" codeName)))
    (with-current-buffer (concat codeType "-" codeName)
      (goto-char (point-max))
      (insert responseBody)

      ;; Remove response header
      (goto-char (point-min))
      (re-search-forward "^$")
      (delete-region (+ (point) 1) (point-min))

      (beginning-of-buffer)
      (js-mode)))

;;;###autoload
(defun a-post-code ()
    "Post the content of the current buffer to its appropriate code record in the DB."
    (interactive)
    (setq codeType (nth 0 (split-string (buffer-name) "-")))
    (setq codeName (nth 1 (split-string (buffer-name) "-")))
    (setq codeText (buffer-substring-no-properties (point-min) (point-max)))

    (if (string= codeType "rule")
        (progn
        (setq ruleID (nth 1 (split-string (let
                   ((url-request-method "GET"))
                 (with-current-buffer (url-retrieve-synchronously (concat "https://localhost/action/codeEditorGetRuleID?codename=codeEditorTestRule")) (prog1 (buffer-string)))) "\n\n")))
        (setq responseBody (nth 1 (split-string (let
            ((url-request-method "POST")
             (url-request-extra-headers
              '(("Content-Type" . "application/json")))
             (url-request-data (json-encode `(("id" . ,ruleID) ("name" . ,codeName) ("code" . ,codeText)))
                               ))
            (with-current-buffer (url-retrieve-synchronously "https://localhost/rules/save") (prog1 (buffer-string)))) "\n\n")))
        (if (string= responseBody "[1]")
            (message "Successfully posted code to the DB.")
            (message (concat "An error occured: " responseBody))))

        (progn (setq responseBody (nth 1 (split-string (let
            ((url-request-method "POST")
             (url-request-extra-headers
              '(("Content-Type" . "text/http")))
             (url-request-data codeText))
            (with-current-buffer (url-retrieve-synchronously (concat "https://localhost/action/codeEditorPlugin?codetype=" codeType "&codename=" codeName)) (prog1 (buffer-string)))) "\n\n")))
                (if (string= responseBody "[]")
                 (message "Successfully posted code to the DB.")
                 (message (concat "An error occured: " responseBody)))
        ))
)

(provide 'apex)
;;; apex.el ends here
