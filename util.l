; 文字列をデリミタで分割
;; strsにはstring,delには文字を指定e.g. del=#\,
(defun split(strs del)
  (let ((buffer "") (res nil))
    (dotimes (i (length strs))
      (cond ((null (eq (elt strs i) del))
	     (setq buffer (concatenate 'string buffer (string (elt strs i)))))
	    (t (setq res (cons buffer res)) (setq buffer ""))))
    (cond ((eq buffer "") (reverse res))
	  (t (reverse (cons buffer res))))))
;; 順列を生成
(defmacro local-rec-perm(x)
  `(local-perm (cons ,x result) (remove ,x list)))
(defun make-permutation(num-set)
  (let ((perm-list nil))
    (defun local-perm (result list)
      (cond ((null list) (push result perm-list));基底で要素を追加
	    (t (dolist (x list)
		 (local-rec-perm x)))))
    (local-perm nil num-set) perm-list));作成したリストを返す
;; while式マクロ
(defmacro while(x &rest body)
  `(do nil
       ((null ,x))
       ,@body))
;; ある数を素因数分解して、そのリストを返す
(defun prime-factor(n)
  (cond ((eq n 1)
	 (list n))
	(t
	 (do ((i 2 (1+ i)) (res nil))
	     ((> (* i i) n) (cond ((eq n 1) res) (t (cons n res))))
	     (while (eq (mod n i) 0)
	       (setq n (/ n i)) (push i res))))))
;; ユニークなリストを作成
 (defun make-unique-list(n)
   (cond ((null n) (return-from make-unique-list n)))
   (let ((res (list (car n))) (prv (car n)))
     (dolist (x n)
       (cond ((null (eq prv x)) (push x res) (setq prv x)))) res))
;; 素数リストを返す
;; eratosthenesの篩を使用
(defun make-prime-list(n)
  (let ((is-prime (make-array (1+ n) :initial-element t))
	(prime-list nil))
    (dotimes (i (1+ n))
      (cond ((< i 2) (setf (aref is-prime i) nil))
	    ((and (>= i 2) (aref is-prime i))
	     (push i prime-list)
	     (do ((j (* i 2) (+ j i)))
		 ((> j n))
		 (setf (aref is-prime j) nil))))) prime-list))
;; 素数かを判定するためのリストを返す
(defun make-prime-check-list(n)
  (let ((is-prime (make-array (1+ n) :initial-element t))
	(prime-list nil))
    (dotimes (i (1+ n))
      (cond ((< i 2) (setf (aref is-prime i) nil))
	    ((and (>= i 2) (aref is-prime i))
	     (push i prime-list)
	     (do ((j (* i 2) (+ j i)))
		 ((> j n))
		 (setf (aref is-prime j) nil))))) is-prime))

;; 配列セットマクロ
(defmacro set-array(ary idx val)
  `(setf (aref ,ary ,idx) ,val))
;; 素数判定
(defun check-prime(n)
  (do ((i 2 (1+ i)))
      ((> (* i i) n) (return-from check-prime t))
    (cond ((zerop (mod n i)) (return-from check-prime nil)))))
;; リストからn要素からなる組みを列挙
(defun make-combination(n lt)
  (cond ((or (zerop n)
	     (null lt)) nil)
	((equal n 1)
	 (mapcar (lambda (res) (list res)) lt))
	(t
	 (append
	  (make-combination n (cdr lt))
	  (mapcar (lambda (res) (cons (car lt) res)) (make-combination (1- n) (cdr lt)))))))

