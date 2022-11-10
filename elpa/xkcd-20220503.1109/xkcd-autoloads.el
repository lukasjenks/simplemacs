;;; xkcd-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "xkcd" "xkcd.el" (0 0 0 0))
;;; Generated autoloads from xkcd.el

(autoload 'xkcd-mode "xkcd" "\
Major mode for viewing xkcd (https://xkcd.com/) comics.

\(fn)" t nil)

(autoload 'xkcd-get "xkcd" "\
Get the xkcd number NUM.

\(fn NUM)" t nil)

(autoload 'xkcd-get-latest "xkcd" "\
Get the latest xkcd." t nil)

(defalias 'xkcd 'xkcd-get-latest)

(register-definition-prefixes "xkcd" '("get-xkcd-from-url" "xkcd-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; xkcd-autoloads.el ends here
