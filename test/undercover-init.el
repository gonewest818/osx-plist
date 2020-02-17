;;; undercover-init.el --- setup undercover

;; `load-file` this into any other file containing tests

(when (require 'undercover nil t)
  (undercover "*.el"
              (:report-file "coverage.json")
              (:send-report nil)))


;; Local Variables:
;; elisp-lint-ignored-validators:
;; ("package-lint" "byte-compile" "check-declare" "checkdoc")
;; End:

;;; undercover-init.el ends here
