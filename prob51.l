; 素数リストを返す
(defun make-prime-list(n)
  (let ((is-prime (make-array (1+ n) :initial-element t))
	(prime-list nil))
    (dotimes (i (1+ n))
      (cond ((< i 2) (setf (aref is-prime i) nil))
	    ((and (>= i 2) (aref is-prime i))
	     (push i prime-list)
	     (do ((j (* i 2) (+ j i)))
		 ((> j n))
		 (setf (aref is-prime j) nil))))) is-prime))

(defun rec(num asta cnt mul)
  (cond ((zerop cnt)
	 (cond ((/= asta 0)
		(let ((tmp 0) (res 0))
		  (dotimes (x 10)
		    (cond ((aref is-prime (+ num (* asta x)))
			   (incf tmp)
			   (cond ((zerop res)
				  (setf res (+ num (* asta x)))))))
		    (cond ((eq tmp 7) (print res)
			   (print (list num asta)))))))))
	(t
	 (dotimes (x 10)
	   (cond ((or (/= 1 cnt) (/= 0 x))
		  (rec (+ num (* mul x)) asta (1- cnt) (* 10 mul)))))
	 (rec num (+ asta mul) (1- cnt) (* 10 mul)))))
(setf is-prime (make-prime-list 1000000))
(rec 0 0 5 1)
