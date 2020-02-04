;;; test-osx-plist.el --- unit tests   -*- lexical-binding: t -*-

(load-file "test/undercover-init.el")
(require 'osx-plist)
(require 'buttercup)

(setenv "TZ" "UTC0") ; make sure dates match their canonical

(describe "the osx-plist-p predicate"
  (it "is truthy when the node is a plist"
    (expect (osx-plist-p '(plist nil nil))
            :to-be-truthy))
  (it "is nil when the node is not a plist"
    (expect (osx-plist-p '(key nil nil))
            :not :to-be-truthy))
  (it "is nil when the node is not a node"
    (expect (osx-plist-p "string-is-invalid")
            :not :to-be-truthy)))

(describe "the osx-plist-parse-file function"
  :var ((good-file "test/data/airport.plist")
        (bad-file "test/data/malformed.plist"))
  (it "reads and parses a file"
    (let* ((p (osx-plist-parse-file good-file))
           (w (aref p 0)))
      (expect (length p) :to-be 5)
      (expect (gethash "BEACON_INT" w) :to-be 100)
      (expect (gethash "BSSID" w) :to-match "^ff:ff:aa:c4:5c:73$")
      (expect (gethash "IE" w) :to-match "^Lorem ipsum dolor sit amet$")
      (expect (gethash "TEST_DATE" w) :to-equal '(45 23 1 7 6 2019 5 nil 0))
      (expect (type-of (gethash "RATES" w)) :to-be 'vector)
      (expect (type-of (gethash "HT_IE" w)) :to-be 'hash-table)))
  (it "returns nil when xml is malformed"
    (let* ((p (osx-plist-parse-file bad-file)))
      (expect p :to-be nil))))

(describe "the osx-plist-parse-buffer function"
  :var* ((good-file "test/data/airport.plist")
         (bad-file "test/data/malformed.plist"))
  (it "parses a buffer"
    (let* ((b (find-file good-file))
           (p (osx-plist-parse-buffer b))
           (w (aref p 0)))
      (expect (length p) :to-be 5)
      (expect (gethash "BEACON_INT" w) :to-be 100)
      (expect (gethash "BSSID" w) :to-match "^ff:ff:aa:c4:5c:73$")
      (expect (gethash "IE" w) :to-match "^Lorem ipsum dolor sit amet$")
      (expect (gethash "TEST_DATE" w) :to-equal '(45 23 1 7 6 2019 5 nil 0))
      (expect (type-of (gethash "RATES" w)) :to-be 'vector)
      (expect (type-of (gethash "HT_IE" w)) :to-be 'hash-table)))
  (it "returns nil when xml is malformed"
    (let* ((b (find-file bad-file))
           (p (osx-plist-parse-buffer b)))
      (expect p :to-be nil))))

;;; test-osx-plist.el ends here
