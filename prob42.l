;; (setq a (make-hash-table :test #'equal))
;; (setf (gethash "abc" a) 100)
;; (princ (gethash "abc" a))
(load "util.l")

(defun proc()
  (do ((i (char-code #\a) (1+ i)) (char-list nil))
      ((< (char-code #\z) i) (reverse char-list))
      (setq char-list (cons (code-char i) char-list))
      (format t " ")))
; 文字列をリストへ変換
(defun string-to-list (str)
  (do ((x (1- (length str)) (1- x)) (res nil))
      ((> 0 x) res)
      (push (elt str x) res)))
; 文字列をアスキーコード数値の和に変換
(defun to-int (str)
  (cond ((eq (length str) 1) (1+ (- (char-code (elt str 0)) (char-code #\A))))
	(t
	 (reduce #'(lambda (&rest a)
		     (let ((res 0))
		       (dolist (x a res)
			 (cond ((typep x 'character) (setq res (+ res (1+ (- (char-code x) (char-code #\A))))))
			       (t (setq res (+ res x)))))))
		 str))))
(defun check-triangle-number(num)
  (do ((i 0 (1+ i)))
      ((<= 100 i) nil)
      (cond ((= (* (1+ i) i) (* 2 num)) (return-from check-triangle-number t)))))
;(print (check-triangle-number 10))
; 文字列の最初と最後についている文字をはずす
(defun adjust-format(str)
  (substring str 1 (1- (length str))))

; メイン処理
(defun main()
  (let ((line nil) (cnt 0))
    ; 文字列を標準入力からもらう
    (setq line (mapcar #'adjust-format (split (read-line) #\,)))
    (setq cnt 0)
    (dotimes (i (length line))
      (cond ((check-triangle-number (to-int (elt line i))) (setq cnt (1+ cnt)))))
    (print cnt)))
(main)
