;;; 0x0-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "0x0" "0x0.el" (0 0 0 0))
;;; Generated autoloads from 0x0.el

(autoload '0x0-upload "0x0" "\
Upload current buffer to `0x0-url' from START to END.

If START and END are not specified, upload entire buffer.

\(fn START END)" t nil)

(autoload '0x0-upload-file "0x0" "\
Upload FILE to `0x0-url'.

\(fn FILE)" t nil)

(autoload '0x0-upload-string "0x0" "\
Upload STRING to `0x0-url'.

\(fn STRING)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "0x0" '("0x0-")))

;;;***

;;;### (autoloads nil nil ("0x0-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; 0x0-autoloads.el ends here
