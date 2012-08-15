(load "util.l")
(make-prime-list 10000)
(setq a (remove-if
	 #'(lambda (x)
	     (let ((cnt 0))
	       (do nil
		((zerop x))
		(incf cnt) (setq x (floor x 10)))
	       (/= cnt 4)))
	 (make-prime-list 10000)))

(setq a (sort a #'<))
(defun sort-digs(x)
  (let ((tmp nil))
    (do nil
	((zerop x))
	(push (mod x 10) tmp) (setq x (floor x 10)))
    (setq tmp (sort tmp #'<)) tmp))

(defun check-perm-nums(x)
  (let ((cmp (sort-digs (car x))))
    (dotimes (i (length x))
    (cond ((/= i 0)
	   (cond ((null (equal cmp (sort-digs (elt x i))))
		  (return-from check-perm-nums nil)))))) t))

(let ((len (length a)))
  (do ((i 0 (1+ i)))
      ((>= i len))
      (do ((j (1+ i) (1+ j)))
	  ((>= j len))
	  (do ((k (1+ j) (1+ k)))
	      ((>= k len))
	      (cond ((and
		      (equal (- (elt a k) (elt a j))
			     (- (elt a j) (elt a i)))
		      (check-perm-nums
		       (list (elt a i) (elt a j) (elt a k))))
		     (print (list (elt a i) (elt a j) (elt a k)))
		     ))))))
