(load "util.l")
(setf str (read-line))
(setf alpha "abcdefghijklmnopqrstuvwxyz")
;; 文字列をasciiリストに変換
(defun str-to-ascii-list(str)
  (let ((lt nil))
    (dotimes (i (length str))
      (push (char-code (char str i)) lt))
    (return-from str-to-ascii-list (reverse lt))))
(defun proc(keys)
  (let ((keyList nil))
    (do ((i 0 (1+ i)))
	((>= i (length str)))
      (push (char-code (elt keys (mod i 3))) keyList))
    (setf keyList (reverse keyList))
    (setf ascii-list (str-to-ascii-list str))
    ;;(print (reduce #'+ (mapcar #'logxor keylist ascii-list)))))
    (print (mapcar #'code-char (mapcar #'logxor keylist ascii-list)))))
;;(print alpha)
;;(print (list-length (split str #\,)))
(do ((i 0 (1+ i)))
    ((>= i (length alpha)))
  (do ((j 0 (1+ j)))
      ((>= j (length alpha)))
    (do ((k 0 (1+ k)))
	((>= k (length alpha)))
      ;;(print `(,(char alpha i) ,(char alpha j) ,(char alpha k)))
      (proc `(,(char alpha i) ,(char alpha j) ,(char alpha k))))))
;;(print (char alpha i)))



    
    ;; ascii-listとkeyListでxor
    ;;(print keyList)
    ;; ここでkeyListとstrの各文字を比較してxor演算を取る
    ;; 結果の和をとって表示
(proc '(#\a #\b #\c))
;;(print (str-to-list "abcde"))
