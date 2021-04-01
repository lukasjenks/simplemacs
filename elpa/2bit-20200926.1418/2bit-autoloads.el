;;; 2bit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "2bit" "2bit.el" (0 0 0 0))
;;; Generated autoloads from 2bit.el

(autoload '2bit-open "2bit" "\
Open FILE as a 2bit file.

This function pulls out the details of the header of the given
file and, if it is a valid 2bit file, returns a `2bit-data'
structure that can be used with other functions.

If MASKING is supplied and is non-NIL mask blocks will be read
and processed too. Note that if MASKING isn't supplied, or is
NIL, the mask block data won't even be loaded to help reduce load
times.

\(fn FILE &optional MASKING)" nil nil)

(autoload '2bit-sequence-count "2bit" "\
Get the count of sequences available inside FILE.

FILE can either be the name of a 2bit file, or can be a value
returned from a call to `2bit-open'.

\(fn FILE)" nil nil)

(autoload '2bit-sequence-names "2bit" "\
Get a list of all the sequence names available in FILE.

FILE can either be the name of a 2bit file, or can be a value
returned from a call to `2bit-open'.

\(fn FILE)" nil nil)

(autoload '2bit-sequence "2bit" "\
Get SEQUENCE from the 2bit data held in FILE.

\(fn FILE SEQUENCE)" nil nil)

(autoload '2bit-bases "2bit" "\
Get the bases of SEQUENCE from START to END.

Note that, as is the usual convention, what is returned is
inclusive of the START location, and exclusive of the END
location.

\(fn SEQUENCE START END)" nil nil)

(autoload '2bit-with-file "2bit" "\
Perform BODY against 2bit file name FILE, using HANDLE as he reader name.

MASKING optionally controls if masking should be handled. The
default is nil.

\(fn (HANDLE FILE &optional MASKING) &body BODY)" nil t)

(function-put '2bit-with-file 'lisp-indent-function '1)

(autoload '2bit-with-sequence "2bit" "\
Perform BODY against SEQUENCE taken from FILE.

NAME will be bound to the sequence data from FILE for the
duration of BODY.

\(fn (NAME SEQUENCE FILE) &body BODY)" nil t)

(function-put '2bit-with-sequence 'lisp-indent-function '1)

(autoload '2bit-insert-bases "2bit" "\
Insert bases bounded START and END, from SEQUENCE in FILE.

If the command is invoked with \\[universal-argument] mask blocks
will be taken into account.

When used as an interactive command, if SEQUENCE is either of the
forms:

  seq:start..end
  seq:start-end

SEQUENCE, START and END will be fully-auto-populated from that
format.

\(fn FILE SEQUENCE START END)" t nil)

(autoload '2bit-insert-fasta "2bit" "\
Insert FASTA format for bases bounded START and END, from SEQUENCE in FILE.

If the command is invoked with \\[universal-argument] mask blocks
will be taken into account.

When used as an interactive command, if SEQUENCE is either of the
forms:

  seq:start..end
  seq:start-end

SEQUENCE, START and END will be fully-auto-populated from that
format.

\(fn FILE SEQUENCE START END)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "2bit" '("2bit-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; 2bit-autoloads.el ends here
