; 文字から数字を得る
(defun char-to-num(ch)
  (let ((a (char-code ch)))
    (cond ((and (<= (char-code #\2) a) (>= (char-code #\9) a))
	   (return-from get-num (- a (char-code #\0))))
	  ((equal #\T ch) (return-from get-num 10))
	  ((equal #\J ch) (return-from get-num 11))
	  ((equal #\Q ch) (return-from get-num 12))
	  ((equal #\K ch) (return-from get-num 13))
	  ((equal #\A ch) (return-from get-num 14)))))


; (約の種類,約の一番大きなカード,約以外で一番大きなカード)
; の情報を作る
(defun is-one-pair(hand)
  (let ((len (length hand)) (cnt 0))
    (dotimes (i len)
    (dotimes (j len)
      (cond ((and (< i j) (equal (elt (elt hand i) 0) (elt (elt hand j) 0))) (incf cnt)))))
    (equal cnt 2)))

					;(defun is-royal-straight-flash(hand)
  

(defun find-hand-rank(hand)
  

