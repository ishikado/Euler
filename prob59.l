(load "util.l")
;; 入力を受け取って,を消去してリストにしそれぞれ数字へ変換
(setf *ascii-list* (mapcar #'parse-integer (split (read-line) #\,)))
;; stringにcharListを変換
(defun charList-to-string(charList)
  (let ((my-string (make-array 0
			      :element-type 'character
			      :fill-pointer 0
			      :adjustable t)))
    (dolist (ch charList)
      (vector-push-extend ch my-string))
    (return-from charList-to-string my-string)))
;; keyListで複合
(defun decode(keys)
  (let ((keyList nil) (res nil))
    (do ((i 0 (1+ i)))
	((>= i (length *ascii-list*)))
      (push (char-code (elt keys (mod i 3))) keyList))
    (setf keyList (reverse keyList))
    (setf res (charList-to-string (mapcar #'code-char (mapcar #'logxor keyList *ascii-list*))))
    (cond ((null (equal nil (search "accept" res)))
	   (print res)
	   (print (reduce #'+ (mapcar #'logxor keyList *ascii-list*)))
	   (return-from decode t)
	   ))) nil)
(setf alpha "abcdefghijklmnopqrstuvwxyz")
;; main処理
(defun main()
  (do ((i 0 (1+ i)))
      ((>= i (length alpha)))
    (do ((j 0 (1+ j)))
	((>= j (length alpha)))
      (do ((k 0 (1+ k)))
	  ((>= k (length alpha)))
	(cond ((decode `(,(char alpha i) ,(char alpha j) ,(char alpha k))) (return-from main)))))))
(main)
;; (cond ((decode `(,(char alpha i) ,(char alpha j) ,(char alpha k))) (return-from main)))))))
