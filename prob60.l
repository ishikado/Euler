;; too slow!!

(load "util.l")

(defun connect-number(n m)
  (return-from connect-number (parse-integer (concatenate 'string (write-to-string n) (write-to-string m)))))
(defun check-exchange-connect-prime(n m)
  (return-from check-exchange-connect-prime
    (and (check-prime (connect-number n m))
	 (check-prime (connect-number m n)))))

;;(print (length (make-prime-list 1000)))
;; (defun make-combination(n lt)
;;   (cond ((or (zerop n) (null lt)) nil)
;; 	((equal n 1)
;; 	 (mapcar (lambda (res) (list res)) lt))
;; 	(t
;; 	 (append
;; 	  (make-combination n (cdr lt))
;; 	  (mapcar
;; 	   (lambda (res)
;; 	     (cons (car lt) res))
;; 	   (make-combination (1- n) (cdr lt)))))))
;;(print (make-combination 2 '(a b c d e)) )

(let ((prime-list (reverse (make-prime-list 100000))) (res 1000000000))
  (defun checkAry(ary num)
    (dolist (i ary)
      (cond ((null (check-exchange-connect-prime i num))
	     (return-from checkAry nil))))
    (return-from checkAry t))
  (defun rec(pos start sum ary)
    (cond ((equal pos 5)
	   (cond ((< sum res) (print sum)))
	   (setf res (min sum res)))
	  (t
	   (do ((i start (1+ i)))
	       ((> (elt prime-list i) 10000))
	       (cond ((and (checkAry ary (elt prime-list i)) (< (+ sum (elt prime-list i)) res))
		      (push (elt prime-list i) ary)
		      ;;(print ary)
		      (rec (1+ pos) i (+ sum (elt prime-list i)) ary)
		      (pop ary)))))))
  (defun main()
    (rec 0 0 0 nil)
    (print res)
    )
  (main)
  )

