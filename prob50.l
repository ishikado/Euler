(load "util.l")
(setf prime-list (make-prime-list 1000000))
(setf prime-list (sort prime-list #'<))
(setf max-len 0)
(setf res 0)
(dolist (p prime-list)
  (print p)
  (do ((sp 0) (tp 0) (tot 2))
      ((>= (elt prime-list tp) p));idx->tpであるリストの要素
      (cond ((< tot p)
	     (incf tp) (setf tot (+ tot (elt prime-list tp))))
	    (t
	     (setf tot (- tot (elt prime-list sp))) (incf sp)))
      (cond ((and (eq tot p) (< max-len (1+ (- tp sp))))
	     (setf max-len (1+ (- tp sp)))
	     (setf res p)))))
(print (list max-len res))

;(print (length primes))
