;;; leetcode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "leetcode" "leetcode.el" (0 0 0 0))
;;; Generated autoloads from leetcode.el

(autoload 'leetcode-toggle-debug "leetcode" "\
Toggle debug." t nil)

(autoload 'leetcode "leetcode" "\
A wrapper for `leetcode--async', because emacs-aio can not be autoloaded.
see: https://github.com/skeeto/emacs-aio/issues/3." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "leetcode" '("dovec" "leetcode-" "to-list")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; leetcode-autoloads.el ends here
