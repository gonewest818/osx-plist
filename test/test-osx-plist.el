;;; test-osx-plist.el --- unit tests   -*- lexical-binding: t -*-

(load-file "test/undercover-init.el")
(require 'osx-plist)
(require 'buttercup)

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
  :var ((file "test/data/airport.plist"))
  (it "reads and parses a file"
    (let* ((p (osx-plist-parse-file file))
           (w (aref p 0)))
      (expect (length p) :to-be 5)
      (expect (gethash "BSSID" w) :to-match "^ff:ff:aa:c4:5c:73$")
      (expect (gethash "BEACON_INT" w) :to-be 100)
      (expect (type-of (gethash "RATES" w)) :to-be 'vector)
      (expect (type-of (gethash "HT_IE" w)) :to-be 'hash-table))))

(describe "the osx-plist-parse-buffer function"
  :var* ((file "test/data/airport.plist")
         (buffer (find-file file)))
  (it "parses a buffer"
    (let* ((p (osx-plist-parse-buffer buffer))
           (w (aref p 0)))
      (expect (length p) :to-be 5)
      (expect (gethash "BSSID" w) :to-match "^ff:ff:aa:c4:5c:73$")
      (expect (gethash "BEACON_INT" w) :to-be 100)
      (expect (type-of (gethash "RATES" w)) :to-be 'vector)
      (expect (type-of (gethash "HT_IE" w)) :to-be 'hash-table))))

;;; test-osx-plist.el ends here
