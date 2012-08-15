(load "util.l")
; 連続する前３つの素因数の種類を覚えておき、どんどん再帰していく
(defun invest(a b c number)
  (let ((d (length (make-unique-list (prime-factor number)))))
    (cond ((and (eq a 4) (eq b 4) (eq c 4) (eq d 4)) number)
	  (t (invest b c d (1+ number))))))
(print (- (invest 1 1 2 5) 3))
