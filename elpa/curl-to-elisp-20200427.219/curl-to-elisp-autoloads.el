;;; curl-to-elisp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "curl-to-elisp" "curl-to-elisp.el" (0 0 0 0))
;;; Generated autoloads from curl-to-elisp.el

(autoload 'curl-to-elisp-httpie-to-elisp "curl-to-elisp" "\
Convert httpie/curlie COMMAND to Emacs Lisp expression, return the expression.

When called interactively or PRINT is non-nil, also pretty-print
the expression in echo area.

\(fn COMMAND &optional PRINT)" t nil)

(autoload 'curl-to-elisp "curl-to-elisp" "\
Convert cURL COMMAND to Emacs Lisp expression, return the expression.

When called interactively or PRINT is non-nil, also pretty-print
the expression in echo area.

\(fn COMMAND &optional PRINT)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "curl-to-elisp" '("curl-to-elisp-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; curl-to-elisp-autoloads.el ends here
