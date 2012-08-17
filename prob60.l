#|
条件を満たす5つの素数の組を見つけたい
5C2=10通りの組み合わせについて，すべてがcheck-exchange-connetc-primeを満たす．
2つの素数の組について，まず条件を満たすものを列挙
次にその組にそれぞれ，1つの素数を足しあわせて条件を満たす3つ組を作成
最後に2つ組みと3つ組みを、数字が重複しないのように結合して完成
|#

(load "util.l")
;; nとmをこの順番でくっつけてintegerとして返す
(defun connect-number(n m)
  (return-from connect-number (parse-integer (concatenate 'string (write-to-string n) (write-to-string m)))))
;; ２つの数字をn+mとしてくっつけてできた数字も
;; m+nとしてくっつけてできた数字も素数ならt
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

(defun main()
  (let ((prime-list (make-prime-list 1000)))
    (make-combination 5 prime-list)))
(main)

