;; While it may not be best practice to do this,
;; I'm surpressing the warning that the cl lib
;; is deprecated as it currently is not being
;; maintained. This is because too many elpa
;; libraries use the library. Hopefully in the
;; future these libraries convert to use cl-lib
;; instead in the future, which is intended to
;; replace the cl library. For now, this statement
;; must remain.
(setq byte-compile-warnings '(cl-functions))
